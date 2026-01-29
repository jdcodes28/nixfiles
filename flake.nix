{
	description = "muh NixOS config flake";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

		helium = {
			url = "github:vikingnope/helium-browser-nix-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		zen-browser = {
			url = "github:youwen5/zen-browser-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, ... }@inputs:
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
