{
	lib,
	user,
	...
}: {
	home.homeDirectory = "/home/${user}";
	home.stateVersion = "26.05";
	home.username = user;

	dconf = {
		enable = true;

		settings = {
			"org/gnome/desktop/interface" = {
				document-font-name = "Inter 11";
				font-name          = "Inter 11";
			};
		};
	};

	imports = [
		./programs
		./xdg.nix
	];
}
