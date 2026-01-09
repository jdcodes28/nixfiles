{ ... }: {
  programs.waybar.settings.mainBar = {
    modules-right = [
      "pulseaudio"
      "network"
      "cpu"
      "memory"
      "temperature"
      "clock"
      "tray"
    ];

    "clock".format = "{:%D %R}";
  };
}
