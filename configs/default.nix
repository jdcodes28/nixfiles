{
	config,
	headless,
	lib,
	machineName,
	pkgs,
	user,
	...
}: {
	hardware.graphics.enable = true;

	services = {
		fstrim.enable = true;
		gvfs.enable   = true;
	};

	fonts.packages = with pkgs; [
		fantasque-sans-mono
		inter
		nerd-fonts.iosevka
		noto-fonts-cjk-sans
		noto-fonts-cjk-serif
	];

	environment.shells = [ pkgs.nushell ];

	users.users.${user} = {
		description = user;
		extraGroups = [ "networkmanager" "wheel" ];
		isNormalUser = true;
		packages = with pkgs; [];
		shell = pkgs.nushell;
	};

	virtualisation.docker = {
		enable = true;
		enableOnBoot = true;

		rootless = {
			enable = true;
			setSocketVariable = true;
		};
	};

	networking.networkmanager.enable = true;
	i18n.defaultLocale = "en_US.UTF-8";

	nixpkgs.config.allowUnfree = true;
	
	environment.systemPackages = with pkgs; [
		git
		neovim
	];

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	imports = [
		./cli.nix
		./hardware/${machineName}.nix
		./machines/${machineName}.nix
	] ++ lib.optionals (!headless) [
		./gui.nix
	];
}