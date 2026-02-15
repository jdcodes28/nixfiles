{
	config,
	pkgs,
	user,
	version,
	inputs,
	...
}: {
	home.username = user;
	home.homeDirectory = "/home/${user}";
	home.stateVersion = version;

	home.packages = with pkgs; [
		_1password-cli
		_1password-gui
		anki
		antigravity-fhs
		avizo
		bat
		bitwarden-desktop
		brave
		brightnessctl
		btop
		catppuccin-cursors.latteLight
		catppuccin-cursors.mochaDark
		chromium
		claude-code
		clipse
		collision
		ente-auth
		eza
		fastfetch
		file-roller
		fzf
		gemini-cli
		gnome-calculator
		gnome-characters
		gnome-clocks
		google-chrome
		grim
		haruna
		helix
		hyprcursor
		hypridle
		hyprland-qt-support
		hyprpicker
		hyprpolkitagent
		hyprshot
		inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default
		inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
		jujutsu
		kdePackages.breeze
		kdePackages.breeze-gtk
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
		opencode
		pavucontrol
		picocrypt-ng
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
		zathura
		zed-editor
		zellij
		zoxide
	];

	dconf.enable = true;

	imports = [
		./programs
		./xdg.nix
	];
}
