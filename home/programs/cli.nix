{ inputs, pkgs, ... }: {
  home.packages = with pkgs; [
    bat
    btop
    delta
    eza
    fastfetch
    fzf
    jujutsu
    opencode
    ripgrep
    tree
    unrar
    zellij
    zoxide
  ];

  programs = {
    carapace = {
      enable = true;
      enableNushellIntegration = true;
    };
  };

  imports = [
    ./git.nix
    ./nushell.nix
    ./ssh.nix
    ./starship.nix
    ./yazi.nix
  ];
}
