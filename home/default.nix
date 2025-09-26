{ config, pkgs, user, version, ... }: {
	home.username = user;
	home.homeDirectory = "/home/${user}";
	home.stateVersion = version;

	home.packages = with pkgs; [
		avizo
		bat
		bitwarden
		brave
		brightnessctl
		catppuccin-cursors.latteLight
		catppuccin-cursors.mochaDark
		chromium
		clipse
		evince
		eza
		fastfetch
		fzf
		grim
		helix
		hyprcursor
		hypridle
		hyprland-qt-support
		hyprpicker
		hyprpolkitagent
		hyprshot
		jujutsu
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
		rofi-wayland
		smile
		swaybg
		swaynotificationcenter
		telegram-desktop
		vivaldi
		wl-clip-persist
		wl-clipboard
		wlsunset
		zoxide
	];

	dconf.enable = true;

	imports = [
		./programs
	];
}