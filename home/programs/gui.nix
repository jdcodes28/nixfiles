{
  inputs,
  pkgs,
  user,
  ...
}: {
  home.packages = with pkgs; [
    (pkgs.callPackage ./volantes.nix {})
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
    (inputs.brave-previews.packages.${pkgs.system}.brave-origin-nightly.override {
      commandLineArgs = [
        " --enable-features=VaapiOnNvidiaGPUs"
      ];
    })
    inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default
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
