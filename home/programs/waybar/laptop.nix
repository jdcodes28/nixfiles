{ ... }: {
  waybar.settings = {
    modules-right = ["pulseaudio" "network" "cpu" "memory" "backlight" "battery" "temperature" "clock" "tray"];

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
  }
}