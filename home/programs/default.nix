{
  config,
  headless,
  lib,
  pkgs,
  ...
}:
let
  dots = "${config.home.homeDirectory}/dots/configs";
  sym = path: config.lib.file.mkOutOfStoreSymlink path;

  configs = {
    btop         = "btop";
    clipse       = "clipse";
    ghostty      = "ghostty";
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

  imports = [
    ./cli.nix
  ] ++ lib.optionals (!headless) [
    ./gui.nix
  ];
}
