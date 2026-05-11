{
	config,
	headless,
	lib,
	machineName,
	pkgs,
	user,
	...
}: {
	services = {
		fstrim.enable = true;
		gvfs.enable   = true;
		pulseaudio.enable = false;

		pipewire = {
			enable = true;
			alsa.enable = true;
			alsa.support32Bit = true;
			pulse.enable = true;
		};
	};

	environment.shells = [ pkgs.nushell ];
	environment.systemPackages = with pkgs; [
		git
		neovim
	];

	fonts.packages = with pkgs; [
		fantasque-sans-mono
		inter
		nerd-fonts.iosevka
		noto-fonts-cjk-sans
		noto-fonts-cjk-serif
	];

	hardware.graphics.enable = true;
	i18n.defaultLocale = "en_US.UTF-8";
	networking.networkmanager.enable = true;
	nixpkgs.config.allowUnfree = true;
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	time.timeZone = "America/Chicago";

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

	imports = [
		./cli.nix
		./hardware/${machineName}.nix
		./machines/${machineName}.nix
	] ++ lib.optionals (!headless) [
		./gui.nix
	];
}
