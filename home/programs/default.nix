{ config, pkgs, ... }:
let
  dots = "${config.home.homeDirectory}/dots/configs";
  sym = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    clipse = "clipse";
    helix  = "helix";
    niri   = "niri";
    rofi   = "rofi";
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

    yazi.enable = true;
  };

  imports = [
    ./ghostty.nix
    ./hyprlock.nix
    ./nushell.nix
    ./starship.nix
    ./hyprland
    ./waybar
  ];
}
