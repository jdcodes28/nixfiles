{ ... }: {
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "HDMI-A-2, 2560x1440@144, 0x0, 1"
      "DP-1, 3840x2160@144, 2560x0, 1"
      "DP-2, 2560x1440@165, 6400x0, 1"
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
      "swaybg -m stretch -o * -i ~/Pictures/Wallpapers/blue_cubes.jpg"
    ];
  };
}