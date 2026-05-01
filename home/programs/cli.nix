{ inputs, pkgs, ... }: {
  home.packages = with pkgs; [
    bat
    btop
    claude-code
    eza
    fastfetch
    fzf
    inputs.codex-cli.packages.${pkgs.system}.default
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