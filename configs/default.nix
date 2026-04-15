{
	config,
	pkgs,
	user,
	niri,
	...
}: {
	hardware.graphics.enable = true;
	
	programs = {
		hyprland = {
				enable          = true;
				withUWSM        = true;
				xwayland.enable = true;
		};

		niri.enable = true;
		niri.package = niri.packages.${pkgs.stdenv.hostPlatform.system}.niri;

		steam = {
			enable                       = true;
			remotePlay.openFirewall      = true;
			dedicatedServer.openFirewall = true;
		};

		thunar = {
			enable = true;

			plugins = with pkgs; [
				thunar-archive-plugin
				thunar-media-tags-plugin
				thunar-vcs-plugin
				thunar-volman
			];
		};

		xfconf.enable   = true;
		xwayland.enable = true;
	};

	security = {
		rtkit.enable          = true;
		polkit.enable         = true;
		pam.services.hyprlock = {};
	};

	services = {
		displayManager.gdm.enable  = true;
		fstrim.enable              = true;
		gnome.gnome-keyring.enable = true;
		gvfs.enable                = true;
		tumbler.enable             = true;
	};

	fonts.packages = with pkgs; [
		fantasque-sans-mono
		inter
		nerd-fonts.iosevka
		noto-fonts-cjk-sans
		noto-fonts-cjk-serif
	];

	fonts.fontconfig = {
		enable = true;
		antialias = true;

		defaultFonts = {
			sansSerif = [ "Inter" ];
		};

		hinting = {
			enable   = true;
			autohint = false;
			style    = "full";
		};

		subpixel = {
			lcdfilter = "default";
			rgba      = "rgb";
		};
	};

	environment.shells = [ pkgs.nushell ];

	users.users.${user}.shell = pkgs.nushell;

	virtualisation.docker = {
		enable = true;
		enableOnBoot = true;

		rootless = {
			enable = true;
			setSocketVariable = true;
		};
	};

	xdg.portal = {
		enable = true;

		extraPortals = with pkgs; [
			xdg-desktop-portal-gnome
			xdg-desktop-portal-gtk
			xdg-desktop-portal-hyprland
		];
	};
}
