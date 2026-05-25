{
  user,
  ...
}:
let
  wallpaperPath = "/home/${user}/Pictures/Wallpapers/";
in
{
  programs.noctalia-shell.settings = {
    wallpaper = {
      monitorDirectories = [
        {
          directory = "${wallpaperPath}2k";
          name      = "HDMI-A-1";
          wallpaper = "";
        }

        {
          directory = "${wallpaperPath}4k";
          name      = "DP-2";
          wallpaper = "";
        }

        {
          directory = "${wallpaperPath}2k";
          name      = "DP-1";
          wallpaper = "";
        }
      ];
    };
  };
}
