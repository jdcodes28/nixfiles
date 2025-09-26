{ machine, ... }: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        height = 20;
        layer = "top";
        modules-left = ["hyprland/workspaces"];

        "hyprland/workspaces" = {
          format = "{name}";
          all-outputs = true;
          on-click = "activate";
        };

        "temperature" = {
          format = "{temperatureC} C";
          max-length = 10;
          hwmon-path = [
            "/sys/class/hwmon/hwmon1/temp1_input"
            "/sys/class/thermal/thermal_zone0/temp"
          ];
        };

        "tray" = {
          spacing = 10;
        };

        "clock" = {
          format = "{:%D %R}";
          tooltip-format = "<tt>{calendar}</tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "left";
            on-scroll = 1;
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
        };

        "cpu" = {
          interval = 10;
          format = "CPU: {usage}%";
          max-length = 10;
        };

        "memory" = {
          interval = 30;
          format = "RAM: {}%";
          format-alt = "RAM: {used:0.1f}GB";
          max-length = 10;
        };

        "network" = {
          interval = 1;
          format-wifi = "{bandwidthDownBytes} {bandwidthUpBytes}";
          format-ethernet = "{bandwidthDownBytes} {bandwidthUpBytes}";
          format-disconnected = "No internet.";
          max-length = 60;
        };

        "pulseaudio" = {
          format = "VOL: {volume}%";
          format-muted = "MUTED";
          on-click = "pavucontrol";
        };

        "custom/themes" = {
          format = "THEME";
          on-click = "~/dots/scripts/themes.nu";
        };
      };
    };

    style = ''
      * {
        font-family: TX-02;
        font-size: 12pt;
      }

      window#waybar {
        background-color: rgba(44, 44, 44, 0.75);
        border-bottom: rgba(170, 170, 170, 0.75);
        color: #fff;
      }

      #workspaces button {
        padding: 0 5px;
        background-color: transparent;
        color: #fff;
        border-radius: 0;
      }

      #workspaces button:hover {
        border: solid 1px #fff;
        border-bottom: solid 3px #fff;
        background-color: rgba(255, 255, 255, 0.75);
        color: #000;
      }

      #workspaces button.active {
        font-weight: bold;
        border: solid 1px rgba(255, 255, 255, 0.75);
        border-bottom: solid 3px rgba(255, 255, 255, 0.75);
      }

      #workspaces button.active:hover {
        border: solid 1px #555;
        border-bottom: solid 3px #555;
        background-color: rgba(0, 0, 0, 0.75);
        color: #000;
      }

      #custom-themes,
      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #tray {
        padding: 0 10px;
        color: #fff;
      }

      #pulseaudio {
        background-color: rgba(170, 170, 0, 0.75);
        border-bottom: solid 3px rgba(233, 233, 0, 0.75);
      }

      #pulseaudio:hover {
        background-color: rgba(233, 233, 0, 0.75);
        border-bottom: solid 3px rgba(170, 170, 0, 0.75);
        color: #000;
      }

      #network {
        background-color: rgba(0, 119, 170, 0.75);
        border-bottom: solid 3px rgba(0, 187, 255, 0.75);
      }

      #network:hover {
        background-color: rgba(0, 187, 255, 0.75);
        border-bottom: solid 3px rgba(0, 119, 170, 0.75);
      }

      #cpu {
        background-color: rgba(187, 0, 0, 0.75);
        border-bottom: solid 3px rgba(255, 0, 0, 0.75);
      }

      #cpu:hover {
        background-color: rgba(255, 0, 0, 0.75);
        border-bottom: solid 3px rgba(187, 0, 0, 0.75);
      }

      #memory {
        background-color: rgba(153, 0, 187, 0.75);
        border-bottom: solid 3px rgba(221, 0, 255, 0.75);
      }

      #memory:hover {
        background-color: rgba(221, 0, 255, 0.75);
        border-bottom: solid 3px rgba(153, 0, 187, 0.75);
      }

      #disk {
        background-color: rgba(221, 136, 0, 0.75);
        border-bottom: solid 3px rgba(255, 170, 0, 0.75);
      }

      #disk:hover {
        background-color: rgba(255, 170, 0, 0.75);
        border-bottom: solid 3px rgba(221, 136, 0, 0.75);
      }

      #temperature {
        background-color: rgba(85, 119, 255, 0.75);
        border-bottom: solid 3px rgba(0, 17, 255, 0.75);
      }

      #temperature:hover {
        background-color: rgba(0, 17, 255, 0.75);
        border-bottom: solid 3px rgba(85, 119, 255, 0.75);
      }

      #battery {
        background-color: rgba(0, 170, 51, 0.75);
        border-bottom: solid 3px rgba(0, 255, 85, 0.75);
      }

      #battery:hover {
        background-color: rgba(0, 255, 85, 0.75);
        border-bottom: solid 3px rgba(0, 170, 51, 0.75);
      }

      #backlight {
        background-color: rgba(85, 85, 85, 0.75);
        border-bottom: solid 3px rgba(170, 170, 170, 0.75);
      }

      #backlight:hover {
        background-color: rgba(170, 170, 170, 0.75);
        border-bottom: solid 3px rgba(85, 85, 85, 0.75);
      }

      #clock, #custom-themes {
        background-color: rgba(85, 85, 85, 0.75);
        border-bottom: solid 3px rgba(170, 170, 170, 0.75);
      }

      #clock:hover, #custom-themes:hover {
        background-color: rgba(170, 170, 170, 0.75);
        border-bottom: solid 3px rgba(85, 85, 85, 0.75);
      }

      #tray {
        background-color: rgba(0, 0, 0, 0.75);
        border-bottom: solid 3px rgba(170, 170, 170, 0.75);
      }

      #tray:hover {
        background-color: rgba(170, 170, 170, 0.75);
        border-bottom: solid 3px rgba(0, 0, 0, 0.75);
      }
    '';
  };

  imports = [
    ./${machine}.nix
  ];
}