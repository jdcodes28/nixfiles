{
  user,
  ...
}:
{
  programs.noctalia.settings = {
    lockscreen_widgets = {
      widget_order = [
        "lockscreen-login-box@eDP-1"
        "lockscreen-widget-0000000000000001"
      ];

      widget = {
        "lockscreen-login-box@eDP-1" = {
          box_height = 196.0;
          box_width = 810.0;
          cx = 960.0;
          cy = 900;
          output = "eDP-1";
          placement_height = 1080.0;
          placement_width = 1920.0;
          rotation = 0.0;
          type = "login_box";

          settings = {
            background_color     = "surface_variant";
            background_opacity   = 0.75;
            background_radius    = 12.0;
            center_password_text = false;
            input_opacity        = 1.0;
            input_radius         = 6.0;
            layout               = "regular";
            show_caps_lock       = true;
            show_keyboard_layout = true;
            show_login_button    = true;
            show_media           = true;
            show_session_buttons = true;
            show_unlock_hint     = true;
            show_weather         = true;
          };
        };

        lockscreen-widget-0000000000000001 = {
          box_height = 0.0;
          box_width = 0.0;
          cx = 960.0;
          cy = 540.0;
          output = "eDP-1";
          placement_height = 1080.0;
          placement_width = 1920.0;
          rotation = 0.0;
          type = "clock";

          settings = {
            background = true;
            background_opacity = 0.33;
            clock_style = "digital";
          };
        };
      };
    };  

    wallpaper.monitor = {
      eDP-1.directory = "/home/${user}/Pictures/Wallpapers/1080p";
    };
  };
}
