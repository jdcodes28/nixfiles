{
	lib,
	user,
	...
}: {
	home.homeDirectory = "/home/${user}";
	home.stateVersion = "26.05";
	home.username = user;

	dconf.enable = true;

	imports = [
		./programs
		./xdg.nix
	];
}
