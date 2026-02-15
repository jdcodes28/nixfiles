{ config, pkgs, user, ...}: {
	hardware.graphics.enable = true;
	
	programs = {
		hyprland = {
				enable          = true;
				withUWSM        = true;
				xwayland.enable = true;
		};

		niri.enable = true;

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
		fstrim.enable              = true;
		gnome.gnome-keyring.enable = true;
		gvfs.enable                = true;
		tumbler.enable             = true;

		displayManager.ly = {
			enable = true;

			settings = {
				animation        = "matrix";
				biglock          = "en";
				bigclock_seconds = true;
				clear_password   = true;
				save_file        = "/etc/ly/save";
			};
		};
	};

	fonts.packages = with pkgs; [
		fantasque-sans-mono
		inter
		nerd-fonts.iosevka
		noto-fonts-sjk-sans
		noto-fonts-sjk-serif
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

	xdg.portal = {
		enable = true;

		extraPortals = with pkgs; [
			xdg-desktop-portal-gnome
			xdg-desktop-portal-gtk
			xdg-desktop-portal-hyprland
		];
	};
}
