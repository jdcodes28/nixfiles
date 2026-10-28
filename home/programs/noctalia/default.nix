{
  inputs,
  machineName,
  user,
  ...
}:
{
  programs.noctalia = {
    enable = true;
    systemd.enable = true;

    settings = {
      audio.enable_sounds = true;

      backdrop = {
        enabled = true;
        tint_intensity = 0.11;
      };

      bar = {
        default = {
          background_opacity = 0.75;
          center = [ "workspaces" ];
          contact_shadow = true;

          end = [
            "tray"
            "notifications"
            "clipboard"
            "network"
            "bluetooth"
            "volume"
            "brightness"
            "battery"
            "clock"
            "control-center"
            "session"
          ];

          margin_edge = 8;
          margin_ends = 8;
          radius      = 16;

          start = [
            "launcher"
            "wallpaper"
            "media"
          ];

          thickness = 28;
          widget_spacing = 11;
        };
      };

      battery.warning_threshold = 20;
      control_center.calendar.show_week_numbers = true;
      desktop_widgets.enabled = false;

      idle = {
        behavior_order = [
          "lock"
          "screen-off"
          "lock-and-suspend"
        ];

        pre_action_fade_seconds = 15;

        behavior = {
          lock = {
            action = "lock";
            enabled = true;
            timeout = 600;
          };

          lock-and-suspend = {
            action = "lock_and_suspend";
            enabled = false;
            timeout = 900;
          };

          screen-off = {
            action = "screen_off";
            enabled = false;
            timeout = 660;
          };
        };
      };

      location.auto_locate = true;

      lockscreen = {
        blur_intensity = 0.33;
        tint_intensity = 0.11;
      };

      lockscreen_widgets = {
        enabled = true;
        schema_version = 2;

        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };
      };

      nightlight = {
        enabled = true;
        temperature_night = 2800;
      };

      notification = {
        background_opacity = 0.75;
        position = "bottom_right";
      };

      osd = {
        background_opacity = 0.75;
      };

      shell = {
        avatar_path = "/home/${user}/profile.png";
        external_ip_enabled = true;
        font_family = "Inter";
        launch_apps_as_systemd_services = true;
        niri_overview_type_to_launch_enabled = true;
        password_style = "random";
        polkit_agent = true;
        screen_time_enabled = true;
        settings_show_advanced = false;
        settings_window_translucent = true;
        telemetry_enabled = true;

        launcher = {
          compact = true;
          show_app_actions = true;

          providers = {
            emoji.global = true;
            windows.global = true;
          };
        };

        panel = {
          open_near_click_control_center = true;
          open_near_click_wallpaper = true;
          session_placement = "floating";
          session_position = "center";
          transparency_mode = "glass";
        };

        screen_corners = {
          enabled = true;
          size = 24;
        };

        screenshot = {
          annotate = true;
          directory = "/home/${user}/Pictures/Screenshots";
          show_cursor = true;
        };

        shadow = {
          direction = "center";
        };
      };

      theme = {
        source = "wallpaper";
        wallpaper_scheme = "m3-fruit-salad";

        templates = {
          enable_builtin_templates = false;
          enable_community_templates = false;
        };
      };

      wallpaper = {
        fill_mode = "stretch";
        per_monitor_directories = true;
        transition_on_startup = true;

        automation = {
          enabled = true;
          interval_seconds = 900;
          random_without_replacement = true;
        };
      };

      weather.unit = "imperial";

      widget = {
        bluetooth.hide_when_no_connected_device = true;
        clock.format = "{:%D %H:%M}";

        media = {
          capsule = true;
          capsule_padding = 0;
          hide_when_no_media = true;
          scroll_repeat = "steps";
          show_progress = true;
          title_scroll = "on_hover";
        };

        network.show_label = false;
        notifications.hide_when_no_unread = true;
      };
    };
  };

  imports = [
    ./${machineName}.nix
  ];
}
