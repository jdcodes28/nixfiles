{ config, pkgs, ... }:
let
	name = "USERNAME";
	machine = "MACHINE";
in
{
	home.username = "${name}";
	home.homeDirectory = "/home/${name}";
	home.stateVersion = "25.05";

	home.packages = with pkgs; [
		wlsunset
		bitwarden
		brightnessctl
		chromium
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
		nautilus
		catppuccin-cursors.latteLight
		catppuccin-cursors.mochaDark
		lunatask
		smile
	];

	dconf.enable = true;

	imports = [
		./programs
		./programs/hyprland/common.nix
		./programs/hyprland/${machine}.nix
		./programs/waybar/common.nix
		./programs/waybar/${machine}.nix
	];
}