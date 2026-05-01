{
	user,
	...
}: {
	home.username = user;
	home.homeDirectory = "/home/${user}";
	home.stateVersion = "25.11";

	dconf.enable = true;

	imports = [
		./programs
		./xdg.nix
	];
}