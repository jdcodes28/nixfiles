{
  inputs,
  pkgs,
  user,
  ...
}: {
  home.packages = with pkgs; [
    _1password-cli
    _1password-gui
    anki
    antigravity-fhs
    bleachbit
    brightnessctl
    chromium
    clipse
    collision
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
    hyprpolkitagent
    hyprshot
    inputs.brave-previews.packages.${pkgs.system}.brave-origin-nightly
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
    ghostty.enable = true;

    vscode = {
      enable = true;
      package = pkgs.vscode.fhs;
    };
  };

  imports = [
    inputs.noctalia.homeModules.default
    ./hyprland
    ./noctalia
    ./obs
    ./volantes.nix
  ];
}
