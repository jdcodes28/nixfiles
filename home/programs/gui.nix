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
    bitwarden-desktop
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
      scripts = [mpvScripts.mpris];
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
    volantes-cursors
    wl-clipboard
    wl-clip-persist
    xwayland-satellite
    zathura
    zed-editor
  ];

  programs = {
    librewolf = {
      enable = true;

      settings = {
        "identity.fxaccounts.enabled" = true;
      };
    };

    ghostty.enable = true;

    vscode = {
      enable = true;
      package = pkgs.vscode.fhs;
    };
  };

  imports = [
    inputs.noctalia.homeModules.default
    ./noctalia
    ./obs
    ./hyprland
  ];
}
