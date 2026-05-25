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
          directory = "${wallpaperPath}1080p";
          name      = "eDP-1";
          wallpaper = "";
        }
      ];
    };
  };
}
