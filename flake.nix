{
	description = "muh NixOS config flake";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

		lanzaboote = {
			url = "github:nix-community/lanzaboote/v0.4.2";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		home-manager = {
			url = "github:nix-community/home-manager/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		dolphin-overlay = {
			url = "github:rumboon/dolphin-overlay";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, lanzaboote, home-manager, dolphin-overlay, ... }@inputs:
	let
		hostname = "HOSTNAME";
		machine = "MACHINE";
		user = "USERNAME";
		version = "25.05";
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

				lanzaboote.nixosModules.lanzaboote
				({ pkgs, lib, ... }: {
					environment.systemPackages = [
						pkgs.sbctl
					];
					boot = {
						loader.systemd-boot.enable = lib.mkForce false;
						lanzaboote = {
							enable = true;
							pkiBundle = "/var/lib/sbctl";
						};
					};
				})

				home-manager.nixosModules.home-manager {
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.${user} = import ./home;
					home-manager.extraSpecialArgs = {
						inherit hostname machine user version;
					};
				}

				{
					nixpkgs.overlays = [ dolphin-overlay.overlays.default ];
				}
			];
		};
	};
}
