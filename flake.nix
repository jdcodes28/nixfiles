{
	description = "muh NixOS config flake";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

		claude-code = {
			url = "github:sadjow/claude-code-nix";
			inputs.nixpkgs.follows = "nixpkgs";
		};

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
		nixpkgs,
		nix-cachyos-kernel,
		home-manager,
		...
	}@inputs:
	let
		hostname = "HOSTNAME";
		machine  = "MACHINE";
		user     = "USERNAME";
		version  = "25.11";
	in
	{
		nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			specialArgs = {
				inherit hostname machine user version;
			};
			modules = [
				./configuration.nix
				./configs
				./configs/${machine}.nix
				./noctalia.nix

				{
					nixpkgs.overlays = [
						inputs.claude-code.overlays.default
						nix-cachyos-kernel.overlays.pinned
					];

					nix.settings.substituters = [ "https://cache.garnix.io" ];
					nix.settings.trusted-public-keys = [ "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g=" ];
				}

				home-manager.nixosModules.home-manager {
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.${user} = import ./home;
					home-manager.extraSpecialArgs = {
						inherit hostname machine user version inputs;
					};
				}
			];
		};
	};
}
