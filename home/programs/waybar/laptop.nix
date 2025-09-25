{ ... }: {
  programs.waybar.settings.mainBar = {
    modules-right = [
      "custom/themes"
      "pulseaudio"
      "network"
      "cpu"
      "memory"
      "backlight"
      "battery"
      "temperature"
      "clock"
      "tray"
    ];

    "backlight" = {
      device = "intel_backlight";
      tooltip = true;
      format = "BRT: {percent}%";
      tooltip-format = "Brightness: {percent}%";
    };

    "battery" = {
      bat = "BAT0";
      adapter = "ADP0";
      interval = 60;
      states = {
        warning = 30;
        critical = 15;
      };
      max-length = 20;
      format = "BAT: {capacity}%";
      format-alt = "BAT: {time}";
    };
  };
}