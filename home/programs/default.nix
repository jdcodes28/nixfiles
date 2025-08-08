{ pkgs, ... }: {
  programs = {
    helix = {
      enable = true;
      settings = {
        editor = {
          line-number = "relative";
          color-modes = true;
          indent-guides.render = true;
          soft-wrap.enable = true;
          bufferline = "multiple";
        };
      };
    };

    hyprlock = {
      enable = true;
      settings = {
        general = {
          hide_cursor = true;
          no_fade_in = false;
          disable_loading_bar = false;
          ignore_empty_input = true;
        };

        background = [
          {
            path = "screenshot";
            blur_passes = 3;
          }
        ];

        input-field = [
          {
            outer_color = "rgba(00ffffbe) rgba(ee00ffbe) rgba(00ffffbe) rgba(ee00ffbe) rgba(00ffffbe) rgba(ee00ffbe) rgba(00ffffbe) rgba(ee00ffbe) rgba(00ffffbe) rgba(ee00ffbe) rgba(00ffffbe) rgba(ee00ffbe)";
            inner_color = "rgba(75, 75, 75, 1.0)";
            font_color = "rgba(255, 255, 255, 1.0)";
            font_family = "TX-02";
            fade_on_empty = false;
            placeholder_text = "Enter password";
            fail_text = "$FAIL ($ATTEMPTS)";
          }
        ];

        label = [
          {
            text = "$TIME";
            font_size = 75;
            font_family = "TX-02";
            position = "0%, 22%";
          }
          {
            text = ''cmd[update:1000] echo "$(date +'%A, %B %e, %Y')"'';
            font_size = 22;
            font_family = "TX-02";
            position = "0%, 11%";
          }
        ];
      };
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

    vscode = {
      enable = true;
      package = pkgs.vscode.fhs;
    };

    nushell = {
			enable = true;
   
			shellAliases = {
				vi = "hx";
				vim = "hx";
				nano = "hx";
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
  };
}