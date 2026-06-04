{
	description = "muh NixOS config flake";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

		brave-previews = {
			url = "github:drishal/brave-browser-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		dolphin-overlay.url = "github:MattiDragon/dolphin-overlay";

		helium = {
			url = "github:vikingnope/helium-browser-nix-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		llm-agents.url = "github:numtide/llm-agents.nix";

		nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";

		noctalia = {
			url = "github:noctalia-dev/noctalia-shell";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		zen-browser = {
			url = "github:youwen5/zen-browser-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = {
		dolphin-overlay,
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
						dolphin-overlay.overlays.default
						llm-agents.overlays.default
						nix-cachyos-kernel.overlays.pinned
					];

					nix.settings = {
						extra-substituters = [
							"https://cache.garnix.io"
							"https://attic.xuyh0120.win/lantian"
							"https://cache.numtide.com"
						];

						extra-trusted-public-keys = [
							"cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
							"lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
							"niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g="
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
