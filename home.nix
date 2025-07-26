{ config, pkgs, ... }:

{
	home.username = "nixxer";
	home.homeDirectory = "/home/nixxer";
	home.stateVersion = "25.05";

	home.packages = with pkgs; [
		wlsunset
		bitwarden
		brightnessctl
		chromium
		kitty
		meld
		mpv
		rofi-wayland
		brave
		vivaldi
		jujutsu
		fzf
		eza
		bat
		zoxide
		fastfetch
		hyprcursor
		hyprshot
		hypridle
		hyprpaper
		hyprpicker
		hyprpolkitagent
		hyprlock
		wl-clipboard
		wl-clip-persist
		clipse
		grim
		evince
		yazi
		networkmanagerapplet
		pavucontrol
		telegram-desktop
		qbittorrent
		playerctl
		swaynotificationcenter
		swaybg
	];

	programs = {
		helix = {
			enable = true;
		};

		waybar = {
			enable = true;
			settings = {
				mainBar = {
					height = 20;
					layer = "top";
					modules-left = ["hyprland/workspaces"];
					modules-right = ["pulseaudio" "network" "cpu" "memory" "backlight" "battery" "temperature" "clock" "tray"];

					"hyprland/workspaces" = {
						format = "{name}";
						all-outputs = true;
						on-click = "activate";
					};

					"temperature" = {
						format = "{temperatureC} C";
						max-length = 10;
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

					"backlight" = {
						device = "intel_backlight";
						tooltip = true;
						format = "BRT: {percent}%";
						tooltip-format = "Brightness: {percent}%";
					};

					"network" = {
						interval = 1;
						format-wifi = "{bandwidthDownBytes} {bandwidthUpBytes}";
						format-ethernet = "{bandwidthDownBytes} {bandwidthUpBytes}";
						format-disconnected = "No internet.";
						max-length = 60;
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

					"pulseaudio" = {
						format = "AUDIO: {volume}%";
						format-muted = "MUTED";
						on-click = "pavucontrol";
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

				#clock {
					background-color: rgba(85, 85, 85, 0.75);
					border-bottom: solid 3px rgba(170, 170, 170, 0.75);
				}

				#clock:hover {
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
		vscode = {
			enable = true;
			package = pkgs.vscode.fhs;
		};

		nushell = {
			enable = true;
			shellAliases = {
				vi = "nvim";
				vim = "nvim";
				nano = "nvim";
			};
			extraConfig = ''
				let carapace_completer = {|spans|
					carapace $spans.0 nushell ...$spans | from json
				}
				$env.config = {
					show_banner: false,
					completions: {
						case_sensitive: false,
						quick: true,
						partial: true,
						algorithm: "fuzzy",
						external: {
							enable: true,
							max_results: 100,
							completer: $carapace_completer
						}
					},
				}
				fastfetch --logo-color-1 "38;2;0;255;255" --logo-color-2 "38;2;255;0;255"
			'';
		};

		carapace = {
			enable = true;
			enableNushellIntegration = true;
		};

		kitty = {
			enable = true;
			settings = {
				enable_audio_bell = true;
				mouse_hide_wait = "-1.0";
				background_opacity = 0.95;
				background_blur = 5;
				font_family = "MonoLisa Variable";
				font_size = 12.0;
			};
		};

		starship = {
			enable = true;
			settings = {
				add_newline = false;
				line_break.disabled = true;
			};
		};
	};

	wayland.windowManager.hyprland = {
		enable = true;
		package = null;
		portalPackage = null;
		settings = {
			"$fileManager" = "thunar";
			"$mainMod" = "SUPER";
			"$menu" = "rofi -show combi -combi-modes 'window,drun' -modes combi -show-icons";
			"$terminal" = "kitty";
			decoration = {
				blur = {
					enabled = true;
					passes = 1;
					size = 3;
					vibrancy = 0.33;
				};

				shadow = {
					color = "rgba(1a1a1aee)";
					enabled = true;
					range = 4;
					render_power = 3;
				};

				active_opacity = 0.95;
				inactive_opacity = 0.75;
				rounding = 0;
			};

			dwindle = {
				preserve_split = true;
				pseudotile = true;
			};

			general = {
				allow_tearing = false;
				border_size = 3;
				"col.active_border" = "rgba(00ffffbe) rgba(ee00ffbe) rgba(00ffffbe) rgba(ee00ffbe) rgba(00ffffbe) rgba(ee00ffbe) rgba(00ffffbe) rgba(ee00ffbe) rgba(00ffffbe) rgba(ee00ffbe) 22deg";
				"col.inactive_border" = "rgba(3c3836be)";
				gaps_in = 5;
				gaps_out = 5;
				layout = "master";
				resize_on_border = false;
			};

			misc = {
				disable_hyprland_logo = true;
				force_default_wallpaper = 0;
			};

			monitor = [
				"eDP-1, 1920x1080, 0x0, 1"
			];

			animations = {
				enabled = "yes, please :)";
				bezier = [
					"easeOutQuint,0.23,1,0.32,1"
					"easeInOutCubic,0.65,0.05,0.36,1"
					"linear,0,0,1,1"
					"almostLinear,0.5,0.5,0.75,1.0"
					"quick,0.15,0,0.1,1"
				];
				animation = [
					"global,1,10,default"
					"border,1,5.39,easeOutQuint"
					"windows,1,4.79,easeOutQuint"
					"windowsIn,1,4.1,easeOutQuint,popin 87%"
					"windowsOut,1,1.49,linear,popin 87%"
					"fadeIn,1,1.73,almostLinear"
					"fadeOut,1,1.46,almostLinear"
					"fade,1,3.03,quick"
					"layers,1,3.03,quick"
					"layersIn,1,4,easeOutQuint,fade"
					"layersOut,1,1.5,linear,fade"
					"fadeLayersIn,1,1.79,almostLinear"
					"fadeLayersOut,1,1.39,almostLinear"
					"workspaces,1,1.94,almostLinear,fade"
					"workspacesIn,1,1.21,almostLinear,fade"
					"workspacesOut,1,1.94,almostLinear,fade"
					"workspaces,1,1.94,almostLinear,fade"
					"workspacesIn,1,1.21,almostLinear,fade"
					"workspacesOut,1,1.94,almostLinear,fade"
				];
			};

			bind = [
				"$mainMod, Return, exec, $terminal"
				"$mainMod, Q, killactive"
				"$mainMod, E, exec, $fileManager"
				"$mainMod, F, togglefloating"
				"$mainMod, D, exec, $menu"
				"$mainMod, P, pseudo"
				"$mainMod, J, togglesplit"
				"$mainMod, N, exec, swaync-client -t -sw"
				"$mainMod, L, exec, hyprlock"
				"$mainMod, left, movefocus, l"
				"$mainMod, right, movefocus, r"
				"$mainMod, up, movefocus, u"
				"$mainMod, down, movefocus, d"
				"$mainMod SHIFT, left, movewindow, l"
				"$mainMod SHIFT, right, movewindow, r"
				"$mainMod SHIFT, up, movewindow, u"
				"$mainMod SHIFT, down, movewindow, d"
				"$mainMod, 1, workspace, 1"
				"$mainMod, 2, workspace, 2"
				"$mainMod, 3, workspace, 3"
				"$mainMod, 4, workspace, 4"
				"$mainMod, 5, workspace, 5"
				"$mainMod, 6, workspace, 6"
				"$mainMod, 7, workspace, 7"
				"$mainMod, 8, workspace, 8"
				"$mainMod, 9, workspace, 9"
				"$mainMod, 0, workspace, 0"
				"$mainMod SHIFT, 1, movetoworkspace, 1"
				"$mainMod SHIFT, 2, movetoworkspace, 2"
				"$mainMod SHIFT, 3, movetoworkspace, 3"
				"$mainMod SHIFT, 4, movetoworkspace, 4"
				"$mainMod SHIFT, 5, movetoworkspace, 5"
				"$mainMod SHIFT, 6, movetoworkspace, 6"
				"$mainMod SHIFT, 7, movetoworkspace, 7"
				"$mainMod SHIFT, 8, movetoworkspace, 8"
				"$mainMod SHIFT, 9, movetoworkspace, 9"
				"$mainMod SHIFT, 0, movetoworkspace, 0"
				"$mainMod CTRL, 1, movetoworkspacesilent, 1"
				"$mainMod CTRL, 2, movetoworkspacesilent, 2"
				"$mainMod CTRL, 3, movetoworkspacesilent, 3"
				"$mainMod CTRL, 4, movetoworkspacesilent, 4"
				"$mainMod CTRL, 5, movetoworkspacesilent, 5"
				"$mainMod CTRL, 6, movetoworkspacesilent, 6"
				"$mainMod CTRL, 7, movetoworkspacesilent, 7"
				"$mainMod CTRL, 8, movetoworkspacesilent, 8"
				"$mainMod CTRL, 9, movetoworkspacesilent, 9"
				"$mainMod CTRL, 0, movetoworkspacesilent, 0"
				"$mainMod, Print, exec, grim -c"
				"$mainMod ALT, Print, exec, hyprshot -m window -z -o /home/nixxer/Pictures/Screenshots"
				"$mainMod SHIFT, Print, exec, hyprshot -m region -z -o /home/nixxer/Pictures/Screenshots"
				"$mainMod, V, exec, $terminal --class clipse -e 'clipse'"
			];

			bindm = [
				"$mainMod, mouse:272, movewindow"
				"$mainMod, mouse:273, resizewindow"
			];

			bindel = [
				",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
				",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
				",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
				",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
				",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
			];

			bindl = [
				",XF86AudioNext, exec, playerctl next"
				",XF86AudioPause, exec, playerctl play-pause"
				",XF86AudioPlay, exec, playerctl play-pause"
				",XF86AudioPrev, exec, playerctl previous"
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
				"swaybg -i ~/Downloads/desert.jpeg"
			];

			input = {
				follow_mouse = 2;
				numlock_by_default = true;
			};

			cursor = {
				no_warps = "false";
				warp_on_change_workspace = 1;
			};

			env = [
				"NIXOS_OZONE_WL,1"
				"XCURSOR_SIZE, 24"
				"HYPRCURSOR_SIZE, 48"
				"HYPRCURSOR_THEME,'Future-Cyan-Hyprcursor_Theme'"
				"XDG_CURRENT_DESKTOP,Hyprland"
				"XDG_SESSION_TYPE,wayland"
				"XDG_SESSION_DESKTOP,Hyprland"
				"QT_QPA_PLATFORM,wayland"
				"XDG_SCREENSHOTS_DIR,$HOME/Pictures/Screenshots"
			];

			windowrule = [
				"float,class:(clipse)"
				"size 600 600,class:(clipse)"
			];

		};
	};
}