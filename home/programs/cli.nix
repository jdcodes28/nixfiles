{ inputs, pkgs, ... }: {
  home.packages = with pkgs; [
    bat
    btop
    delta
    eza
    fastfetch
    fzf
    jd-diff-patch
    jq
    jujutsu
    ripgrep
    traceroute
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
