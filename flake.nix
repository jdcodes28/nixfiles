{
	description = "muh NixOS config flake";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

		brave-previews = {
			url = "github:drishal/brave-browser-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		claude-code = {
			url = "github:sadjow/claude-code-nix";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		codex-cli.url = "github:sadjow/codex-cli-nix";

		helium = {
			url = "github:vikingnope/helium-browser-nix-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

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
		self,
		brave-previews,
		home-manager,
		nixpkgs,
		nix-cachyos-kernel,
		...
	}@inputs:
	let
		machines = {
			charon.type = "laptop";
			hydra.type = "desktop";
		};

		user = "USER";

		mkSystem = name: cfg: nixpkgs.lib.nixosSystem {
			system = cfg.system or "x86_64-linux";

			specialArgs = {
				inherit user;
				machineName = name;
				machineType = cfg.type;
				headless = cfg.headless or false;
			};

			modules = [
				./configs

				{
					networking.hostName = name;

					nixpkgs.overlays = [
						inputs.claude-code.overlays.default
						nix-cachyos-kernel.overlays.pinned
					];

					nix.settings = {
						extra-substituters = [
							"https://cache.garnix.io"
							"https://attic.xuyh0120.win/lantian"
						];

						extra-trusted-public-keys = [
							"cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
							"lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
						];
					};
				}

				home-manager.nixosModules.home-manager

				{
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.${user} = import ./home;

					home-manager.extraSpecialArgs = {
						inherit brave-previews inputs user;
						machineName = name;
						machineType = cfg.type;
						headless = cfg.headless or false;
					};
				}
			];
		};
	in
	{
		nixosConfigurations = nixpkgs.lib.mapAttrs mkSystem machines;
	};
}
