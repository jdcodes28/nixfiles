{ config, pkgs, ...}: {
	hardware.graphics.enable = true;
	
	programs = {
		hyprland = {
				enable = true;
				withUWSM = true;
				xwayland.enable = true;
		};

		thunar = {
			enable = true;
			plugins = with pkgs.xfce; [
				thunar-archive-plugin
				thunar-volman
			];
		};

		xfconf.enable = true;
		file-roller.enable = true;
		xwayland.enable = true;
	};

	security = {
		rtkit.enable = true;
		polkit.enable = true;
		pam.services.hyprlock = {};
	};

	services = {
		gvfs.enable = true;
		tumbler.enable = true;

		xserver.displayManager.gdm = {
			enable = true;
			wayland = true;
		};
	};

	environment.shells = [ pkgs.nushell ];

	users.users.nixxer.shell = pkgs.nushell;

	xdg.portal = {
		enable = true;
		extraPortals = with pkgs; [
			xdg-desktop-portal-hyprland
		];
	};
}
