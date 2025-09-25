{ ... }: {
  programs.waybar.settings.mainBar = {
    modules-right = [
      "custom/themes"
      "pulseaudio"
      "network"
      "cpu"
      "memory"
      "temperature"
      "clock"
      "tray"
    ];
  };
}