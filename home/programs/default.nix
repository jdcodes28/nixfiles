{ pkgs, ... }: {
  programs = {
    helix.enable = true;

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
  };
}