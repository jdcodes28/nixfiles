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

		niri = {
			url = "github:niri-wm/niri/main";
			inputs.nixpkgs.follows = "nixpkgs";
			inputs.rust-overlay.follows = "";
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
		niri,
		nixpkgs,
		nix-cachyos-kernel,
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
				inherit hostname machine niri user version;
			};
			modules = [
				./configuration.nix
				./configs
				./configs/${machine}.nix

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
						inherit brave-previews hostname inputs machine user version;
					};
				}
			];
		};
	};
}
