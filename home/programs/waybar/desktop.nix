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

    "custom/themes" = {
      format = "THEME SWITCH";
      on-click = "~/dots/scripts/themes.nu";
    };
  };
}