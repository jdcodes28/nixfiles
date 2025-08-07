{ config, pkgs, ... }: {
	home.username = "nixxer";
	home.homeDirectory = "/home/nixxer";
	home.stateVersion = "25.05";

	home.packages = with pkgs; [
		wlsunset
		bitwarden
		brightnessctl
		chromium
		kitty
		meld
		(mpv.override {
			scripts = [mpvScripts.mpris];
		})
		rofi-wayland
		brave
		vivaldi
		jujutsu
		fzf
		eza
		bat
		zoxide
		fastfetch
		hyprcursor
		hyprshot
		hypridle
		hyprpicker
		hyprpolkitagent
		wl-clipboard
		wl-clip-persist
		clipse
		grim
		evince
		yazi
		networkmanagerapplet
		pavucontrol
		telegram-desktop
		qbittorrent
		playerctl
		swaynotificationcenter
		swaybg
		loupe
		avizo
		hyprland-qt-support
		kdePackages.qtwayland
		kdePackages.dolphin
		kdePackages.qtsvg
		kdePackages.kio-fuse
		kdePackages.kio-extras
	];

	dconf.enable = true;

	imports = [
		./programs
		./programs/hyprland/common.nix
		./programs/hyprland/MACHINE.nix
		./programs/waybar/common.nix
		./programs/waybar/MACHINE.nix
	];
}