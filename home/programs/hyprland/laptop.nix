{ ... }: {
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "eDP-1, 1920x1080, 0x0, 1"
    ];

    exec-once = [
      "waybar"
      "clipse -listen"
      "wlsunset -l 41.7 -L -87.7 -t 3250 -T 6500"
      "nm-applet --indicator"
      "hypridle"
      "hyprpaper"
      "hyprpolkitagent"
      "swaync"
      "swaybg -i ~/Pictures/Wallpapers/desert.jpeg"
    ];
  };
}