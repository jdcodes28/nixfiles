{
  programs.nushell = {
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
}