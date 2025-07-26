{ config, pkgs, ...}: {
	programs.hyprland = {
		enable = true;
		withUWSM = true;
		xwayland.enable = true;
	};

	programs.thunar = {
		enable = true;
		plugins = with pkgs.xfce; [
			thunar-archive-plugin
			thunar-volman
		];
	};

	programs.xfconf.enable = true;
	programs.file-roller.enable = true;

	services.gvfs.enable = true;
	services.tumbler.enable = true;
	services.displayManager.sddm.enable = true;
	services.displayManager.sddm.wayland.enable = true;
	environment.shells = [ pkgs.nushell ];

	users.users.nixxer.shell = pkgs.nushell;
}
