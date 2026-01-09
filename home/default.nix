{ config, pkgs, user, version, ... }: {
	home.username = user;
	home.homeDirectory = "/home/${user}";
	home.stateVersion = version;

	home.packages = with pkgs; [
		_1password-cli
		_1password-gui
		anki
		avizo
		bat
		bitwarden-desktop
		brave
		brightnessctl
		btop
		catppuccin-cursors.latteLight
		catppuccin-cursors.mochaDark
		chromium
		clipse
		collision
		ente-auth
		eza
		fantasque-sans-mono
		fastfetch
		file-roller
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
		kdePackages.breeze
		kdePackages.breeze-gtk
		kdePackages.dolphin
		kdePackages.kweather
		kdePackages.okular
		krita
		libreoffice-qt-fresh
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
		ripgrep
		rofimoji
		rofi
		swaybg
		swaynotificationcenter
		telegram-desktop
		unrar
		vivaldi
		wl-clip-persist
		wl-clipboard
		wlsunset
		xwayland-satellite
		zoxide
		zellij
	];

	dconf.enable = true;

	imports = [
		./programs
		./xdg.nix
	];
}
