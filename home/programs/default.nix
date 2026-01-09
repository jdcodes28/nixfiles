{ config, pkgs, ... }:
let
  dots = "${config.home.homeDirectory}/dots/configs";
  sym = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    btop         = "btop";
    clipse       = "clipse";
    dolphinrc    = "dolphinrc";
    helix        = "helix";
    niri         = "niri";
    okularpartrc = "okularpartrc";
    rofi         = "rofi";
    zellij       = "zellij";
  };
in
{
  xdg.configFile = builtins.mapAttrs
  (name: subpath: {
    source = sym "${dots}/${subpath}";
    recursive = true;
  })
  configs;

  programs = {
    librewolf = {
      enable = true;
      settings = {
        "identity.fxaccounts.enabled" = true;
      };
    };

    carapace = {
      enable = true;
      enableNushellIntegration = true;
    };

    vscode = {
      enable = true;
      package = pkgs.vscode.fhs;
    };
  };

  imports = [
    ./ghostty.nix
    ./git.nix
    ./hyprlock.nix
    ./nushell.nix
    ./ssh.nix
    ./starship.nix
    ./hyprland
    ./waybar
    ./yazi.nix
  ];
}
