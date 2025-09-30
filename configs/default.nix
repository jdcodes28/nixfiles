{ config, pkgs, user, ...}: {
	hardware.graphics.enable = true;
	
	programs = {
		hyprland = {
				enable = true;
				withUWSM = true;
				xwayland.enable = true;
		};

		steam = {
			enable = true;
			remotePlay.openFirewall = true;
			dedicatedServer.openFirewall = true;
		};

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

	fonts.fontconfig = {
		hinting.style = "full";
		subpixel.rgba = "rgb";
	};

	environment.shells = [ pkgs.nushell ];

	users.users.${user}.shell = pkgs.nushell;

	xdg.portal = {
		enable = true;
		extraPortals = with pkgs; [
			xdg-desktop-portal-hyprland
		];
	};
}
