{ config, pkgs, user, ...}: {
	hardware.graphics.enable = true;
	
	programs = {
		hyprland = {
				enable = true;
				withUWSM = true;
				xwayland.enable = true;
		};

		niri.enable = true;

		steam = {
			enable = true;
			remotePlay.openFirewall = true;
			dedicatedServer.openFirewall = true;
		};

		xwayland.enable = true;
	};

	security = {
		rtkit.enable = true;
		polkit.enable = true;
		pam.services.hyprlock = {};
	};

	services = {
		gnome.gnome-keyring.enable = true;
		gvfs.enable = true;
		tumbler.enable = true;

		displayManager.gdm = {
			enable = true;
			wayland = true;
		};
	};

	fonts.fontconfig = {
		enable = true;
		antialias = true;

		defaultFonts = {
			sansSerif = [ "Inter" ];
		};

		hinting = {
			enable = true;
			autohint = false;
			style = "full";
		};

		subpixel = {
			lcdfilter = "default";
			rgba = "rgb";
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
