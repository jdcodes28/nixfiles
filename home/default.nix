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
		mpv
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
		hyprpaper
		hyprpicker
		hyprpolkitagent
		hyprlock
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
	];

	imports = [
		./programs
		./programs/hyprland/common.nix
		./programs/hyprland/MACHINE.nix
		./programs/waybar/common.nix
		./programs/waybar/MACHINE.nix
	];
}