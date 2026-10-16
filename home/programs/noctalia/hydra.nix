{
  user,
  ...
}:
{
  programs.noctalia.settings = {
    lockscreen_widgets = {
      widget_order = [
        "lockscreen-login-box@DP-1"
        "lockscreen-login-box@DP-2"
        "lockscreen-login-box@HDMI-A-1"
        "lockscreen-widget-0000000000000001"
        "lockscreen-widget-0000000000000002"
        "lockscreen-widget-0000000000000003"
      ];

      widget = {
        "lockscreen-login-box@DP-1" = {
          box_height       = 196.0;
          box_width        = 720.0;
          cx               = 1280.0;
          cy               = 1321.0;
          output           = "DP-1";
          placement_height = 1440.0;
          placement_width  = 2560.0;
          rotation         = 0.0;
          type             = "login_box";

          settings = {
            background_color     = "surface_variant";
            background_opacity   = 0.75;
            background_radius    = 12.0;
            center_password_text = false;
            input_opacity        = 0.75;
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

        "lockscreen-login-box@DP-2" = {
          box_height       = 196.0;
          box_width        = 720.0;
          cx               = 1920.0;
          cy               = 1980.0;
          output           = "DP-2";
          placement_height = 2160.0;
          placement_width  = 3840.0;
          rotation         = 0.0;
          type             = "login_box";

          settings = {
            background_color     = "surface_variant";
            background_opacity   = 0.75;
            background_radius    = 12.0;
            center_password_text = false;
            input_opacity        = 0.75;
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

        "lockscreen-login-box@HDMI-A-1" = {
          box_height       = 196.0;
          box_width        = 720.0;
          cx               = 1280.0;
          cy               = 1321.0;
          output           = "HDMI-A-1";
          placement_height = 1440.0;
          placement_width  = 2560.0;
          rotation         = 0.0;
          type             = "login_box";

          settings = {
            background_color     = "surface_variant";
            background_opacity   = 0.75;
            background_radius    = 12.0;
            center_password_text = false;
            input_opacity        = 0.75;
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
          box_height       = 0.0;
          box_width        = 0.0;
          cx               = 1920.0;
          cy               = 1080.0;
          output           = "DP-2";
          placement_height = 2160.0;
          placement_width  = 3840.0;
          rotation         = 0.0;
          type             = "clock";

          settings = {
            background         = true;
            background_opacity = 0.33;
            clock_style        = "digital";
          };
        };

        lockscreen-widget-0000000000000002 = {
          box_height       = 0.0;
          box_width        = 0.0;
          cx               = 1280.0;
          cy               = 720.0;
          output           = "DP-1";
          placement_height = 1440.0;
          placement_width  = 2560.0;
          rotation         = 0.0;
          type             = "clock";

          settings = {
            background         = true;
            background_opacity = 0.33;
            clock_style        = "digital";
          };
        };

        lockscreen-widget-0000000000000003 = {
          box_height       = 0.0;
          box_width        = 0.0;
          cx               = 1280.0;
          cy               = 720.0;
          output           = "HDMI-A-1";
          placement_height = 1440.0;
          placement_width  = 2560.0;
          rotation         = 0.0;
          type             = "clock";

          settings = {
            background         = true;
            background_opacity = 0.33;
            clock_style        = "digital";
          };
        };
      };
    };

    wallpaper.monitor = {
      DP-1.directory     = "/home/${user}/Pictures/Wallpapers/2k";
      DP-2.directory     = "/home/${user}/Pictures/Wallpapers/4k";
      HDMI-A-1.directory = "/home/${user}/Pictures/Wallpapers/2k";
    };
  };
}


