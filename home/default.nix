{ config, pkgs, user, version, ... }: {
	home.username = user;
	home.homeDirectory = "/home/${user}";
	home.stateVersion = version;

	home.packages = with pkgs; [
		anki
		avizo
		bat
		bitwarden
		brave
		brightnessctl
		catppuccin-cursors.latteLight
		catppuccin-cursors.mochaDark
		chromium
		clipse
		collision
		ente-auth
		evince
		eza
		fastfetch
		fzf
		gnome-calculator
		gnome-characters
		gnome-clocks
		grim
		helix
		hyprcursor
		hypridle
		hyprland-qt-support
		hyprpicker
		hyprpolkitagent
		hyprshot
		inter
		jujutsu
		kdePackages.dolphin
		loupe
		lunatask
		meld
		(mpv.override {
			scripts = [mpvScripts.mpris];
		})
		nautilus
		networkmanagerapplet
		pavucontrol
		playerctl
		qbittorrent
		rofimoji
		rofi-wayland
		swaybg
		swaynotificationcenter
		telegram-desktop
		vivaldi
		wl-clip-persist
		wl-clipboard
		wlsunset
		xwayland-satellite
		zoxide
	];

	dconf.enable = true;

	imports = [
		./programs
		./xdg.nix
	];
}