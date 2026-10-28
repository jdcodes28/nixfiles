{
  inputs,
  osConfig,
  pkgs,
  user,
  ...
}: {
  home.packages = with pkgs; [
    (pkgs.callPackage ./cursors.nix {
      win2xcur-src = inputs.win2xcur;

      packages = with pkgs; [
        bibata-cursors
      ];
    })
    anki
    bitwarden-desktop
    bleachbit
    brightnessctl
    chromium
    clipse
    collision
    czkawka
    ente-auth
    file-roller
    gnome-calculator
    gnome-characters
    gnome-clocks
    google-chrome
    haruna
    helix
    hyprcursor
    hyprpicker
    hyprshot
    ((inputs.brave-previews.packages.${pkgs.system}.brave-origin-nightly.override {
      commandLineArgs = [
        " --enable-features=VaapiOnNvidiaGPUs"
      ];
    }).overrideAttrs (old: {
      preFixup = (old.preFixup or "") + pkgs.lib.optionalString (
        builtins.elem "nvidia" osConfig.services.xserver.videoDrivers
      ) ''
        # Browser-only workaround for nvidia-vaapi-driver's modifier crash:
        # https://github.com/elFarto/nvidia-vaapi-driver/issues/474
        gappsWrapperArgs+=(--set NVD_SINGLE_BUFFER 1)
      '';
    }))
    kdePackages.breeze
    kdePackages.breeze-gtk
    kdePackages.dolphin
    kdePackages.kweather
    kdePackages.okular
    keepassxc
    krita
    libreoffice-qt-fresh
    loupe
    meld
    (mpv.override {
      scripts = with mpvScripts; [
        mpris
        thumbfast
        uosc
        videoclip
      ];
    })
    nautilus
    networkmanagerapplet
    onlyoffice-desktopeditors
    picocrypt-ng
    playerctl
    pwvucontrol
    qbittorrent
    rofimoji
    rofi
    satty
    telegram-desktop
    vivaldi
    wl-clipboard
    wl-clip-persist
    xwayland-satellite
    zathura
    zed-editor
  ];

  programs = {
    atuin.enable = true;
    ghostty.enable = true;
  };

  imports = [
    inputs.noctalia.homeModules.default
    ./firefox
    ./hyprland
    ./noctalia
    ./obs
  ];
}
