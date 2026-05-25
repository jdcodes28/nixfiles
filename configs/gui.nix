{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    sbctl
  ];

  fonts.fontconfig = {
    enable = true;
    antialias = true;

    defaultFonts = {
      sansSerif = [ "Inter" ];
    };

    hinting = {
      enable = true;
      autohint = false;
      style = "full";
    };

    subpixel = {
      lcdfilter = "default";
      rgba = "rgb";
    };
  };

  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };

    niri.enable = true;
    steam.enable = true;

    thunar = {
      enable = true;

      plugins = with pkgs; [
        thunar-archive-plugin
        thunar-media-tags-plugin
        thunar-vcs-plugin
        thunar-volman
      ];
    };
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  services = {
    displayManager.ly = {
      enable = true;

      settings = {
        animation        = "matrix";
        bigclock         = "en";
        bigclock_seconds = true;
        clear_password   = true;
      };
    };

    gnome.gnome-keyring.enable = true;
    tumbler.enable = true;

    xserver.xkb = {
      layout = "us";
      variant = "";
    };
  };

  xdg.portal = {
    enable = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };
}
