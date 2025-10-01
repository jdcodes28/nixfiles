{ machine, ... }: {
  wayland.windowManager.hyprland = {
		enable = true;
		package = null;
		portalPackage = null;
		settings = {
			"$fileManager" = "dolphin";
			"$mainMod" = "SUPER";
			"$menu" = "rofi -show";
			"$terminal" = "ghostty";
			decoration = {
				blur = {
					enabled = true;
					passes = 2;
					size = 5;
					vibrancy = 0.33;
				};

				shadow = {
					color = "rgba(000000ee)";
					enabled = true;
					range = 5;
					render_power = 2;
				};

				active_opacity = 0.95;
				inactive_opacity = 0.75;
				dim_inactive = true;
				dim_strength = 0.25;
				rounding = 0;
			};

			dwindle = {
				preserve_split = false;
				pseudotile = true;
			};

			general = {
				allow_tearing = false;
				border_size = 4;
				"col.active_border" = "rgba(88ffffaa) rgba(cc33ffaa) rgba(ff33aaaa) rgba(ffcc33aa) rgba(77ff55aa) rgba(77ff55aa) rgba(ffcc33aa) rgba(ff33aaaa) rgba(cc33ffaa) rgba(88ffffaa) 22deg";
				"col.inactive_border" = "rgba(3c3836be)";
				gaps_in = 5;
				gaps_out = 5;
				layout = "dwindle";
				resize_on_border = false;
			};

			misc = {
				disable_hyprland_logo = true;
				force_default_wallpaper = 0;
			};

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
				"$mainMod,  left, movefocus, l"
				"$mainMod, right, movefocus, r"
				"$mainMod,    up, movefocus, u"
				"$mainMod,  down, movefocus, d"
				"$mainMod SHIFT,  left, movewindow, l"
				"$mainMod SHIFT, right, movewindow, r"
				"$mainMod SHIFT,    up, movewindow, u"
				"$mainMod SHIFT,  down, movewindow, d"
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
				"$mainMod ALT, Print, exec, hyprshot -m window -z -o ~/Pictures/Screenshots"
				"$mainMod SHIFT, Print, exec, hyprshot -m region -z -o ~/Pictures/Screenshots"
				"$mainMod, V, exec, $terminal --class=com.ghostty.clipse -e 'clipse'"
				"$mainMod, C, exec, hyprpicker -a"
				"$mainMod, M, exec, rofimoji -a copy type -s light"
			];

			bindm = [
				"$mainMod, mouse:272, movewindow"
				"$mainMod, mouse:273, resizewindow"
			];

			bindel = [
				",XF86AudioRaiseVolume,  exec, volumectl -u up"
				",XF86AudioLowerVolume,  exec, volumectl -u down"
				",XF86AudioMute,         exec, volumectl toggle-mute"
				",XF86AudioMicMute,      exec, volumectl -m toggle-mute"
				",XF86MonBrightnessUp,   exec, lightctl up"
				",XF86MonBrightnessDown, exec, lightctl down"
			];

			bindl = [
				",XF86AudioNext,  exec, playerctl next"
				",XF86AudioPause, exec, playerctl play-pause"
				",XF86AudioPlay,  exec, playerctl play-pause"
				",XF86AudioPrev,  exec, playerctl previous"
			];

			exec = [
				"avizo-service"
			];

			exec-once = [
				"waybar"
				"clipse -listen"
				"wlsunset -l 41.7 -L -87.7 -t 3250 -T 6500"
				"nm-applet --indicator"
				"hypridle"
				"swaync"
				"swaybg -o '*' -m stretch -i $(find ~/Pictures/Wallpapers -maxdepth 1 -type f | shuf -n 1)"
				"systemctl --user start hyprpolkitagent"
				"nu ~/dots/scripts/cursor.nu"
			];

			input = {
				follow_mouse = 2;
				numlock_by_default = true;
				accel_profile = "flat";
			};

			cursor = {
				no_warps = "false";
				warp_on_change_workspace = 1;
			};

			env = [
				"NIXOS_OZONE_WL,1"
				"XCURSOR_SIZE, 24"
				"HYPRCURSOR_SIZE, 24"
				"HYPRCURSOR_THEME, 'catppuccin-latte-light-cursors'"
				"XDG_CURRENT_DESKTOP,Hyprland"
				"XDG_SESSION_TYPE,wayland"
				"XDG_SESSION_DESKTOP,Hyprland"
				"QT_QPA_PLATFORM,wayland"
				"QT_QPA_PLATFORMTHEME,gnome"
				"QT_QUICK_CONTROLS_STYLE,org.hyprland.style"
				"QT_AUTO_SCREEN_SCALE_FACTOR,1"
				"QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
				"GDK_SCALE,1"
				"QT_SCALE_FACTOR,1"
				"MOZ_ENABLE_WAYLAND,1"
				"XDG_SCREENSHOTS_DIR,$HOME/Pictures/Screenshots"
				"ELECTRON_OZONE_PLATFORM_HINT,wayland"
				"EDITOR,hx"
				"GRIM_DEFAULT_DIR,$HOME/Pictures/Screenshots"
			];

			windowrule = [
				"float,class:(com.ghostty.clipse)"
				"size 800 600,class:(com.ghostty.clipse)"
				"float,title:(Smile)"
				"size 800 600,title:(Smile)"
			];
		};
	};

	imports = [
		./${machine}.nix
	];
}
