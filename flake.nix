{
	description = "muh NixOS config flake";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

		brave-previews = {
			url = "github:jdcodes28/brave-browser-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		helium.url = "github:greyxp1/helium-flake";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		llm-agents.url = "github:numtide/llm-agents.nix";
		nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
		noctalia.url = "github:noctalia-dev/noctalia/cachix";

		win2xcur = {
			url = "github:jdcodes28/win2xcur";
			flake = false;
		};

		zen-browser = {
			url = "github:youwen5/zen-browser-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = {
		home-manager,
		llm-agents,
		nixpkgs,
		nix-cachyos-kernel,
		...
	}@inputs:
	let
		machines = {
			charon = {};
			hydra  = {};
		};

		user = "USER";

		mkSystem = name: cfg: nixpkgs.lib.nixosSystem {
			specialArgs = {
				inherit inputs user;
				machineName = name;
				headless    = cfg.headless or false;
			};

			modules = [
				./configs

				{
					networking.hostName = name;

					nixpkgs.overlays = [
						llm-agents.overlays.shared-nixpkgs
						nix-cachyos-kernel.overlays.pinned
					];

					nix.settings = {
						extra-substituters = [
							"https://cache.numtide.com"
							"https://noctalia.cachix.org"
							"https://cache.lantian.pub/lantian"
							"https://cache.xinux.uz"
						];

						extra-trusted-public-keys = [
							"niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g="
							"noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
							"lantian:WVGO7vsRMSEN+h7Lp7kv6SAmrkEXgUGbbXm7jMDjBuQ="
							"cache.xinux.uz:BXCrtqejFjWzWEB9YuGB7X2MV4ttBur1N8BkwQRdH+0="
						];
					};
				}

				home-manager.nixosModules.home-manager

				{
					home-manager.useGlobalPkgs   = true;
					home-manager.useUserPackages = true;
					home-manager.users.${user}   = import ./home;

					home-manager.extraSpecialArgs = {
						inherit inputs user;
						machineName = name;
						headless    = cfg.headless or false;
					};
				}
			];
		};
	in
	{
		nixosConfigurations = nixpkgs.lib.mapAttrs mkSystem machines;
	};
}
