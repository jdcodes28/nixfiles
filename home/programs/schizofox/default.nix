{
  programs.schizofox = {
    enable = true;

    search = {
      defaultSearchEngine = "Searx";

      addEngines = [
        {
          Name = "Nixpkgs";
          Description = "Search Nixpkgs";
          Alias = "!np";
          Method = "GET";
          URLTemplate = "https://search.nixos.org/packages?channel=unstable&query={searchTerms}";
        }

        {
          Name = "Nix Options";
          Description = "Search Nix options";
          Alias = "!no";
          Method = "GET";
          URLTemplate = "https://search.nixos.org/options?channel=unstable&query={searchTerms}";
        }

        {
          Name = "NixOS Wiki";
          Description = "Search the Nix wiki";
          Alias = "!nw";
          Method="GET";
          URLTemplate = "https://wiki.nixos.org/w/index.php?search={searchTerms}";
        }
      ];
    };

    settings = {
      "browser.startup.page" = 0;
      "browser.uiCustomization.state" = builtins.readFile ./toolbar.json;
      "extensions.formautofill.addresses.enabled"   = false;
      "extensions.formautofill.creditCards.enabled" = false;
      "general.smoothScroll" = false;
      "network.trr.mode" = 3;
      "network.trr.custom_uri" = "https://dns.nextdns.io/";
      "privacy.userContext.newTabContainerOnLeftClick.enabled" = true;
    };

    extensions = {
      enableDefaultExtensions = true;
      enableExtraExtensions   = true;
      darkreader.enable       = true;

      extraExtensions = let
        moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
      in {
        "browser-extension@anonaddy".install_url             = moz "addy_io";
        "{446900e4-71c2-419f-a6a7-df9c091e268b}".install_url = moz "bitwarden-password-manager";
        "gdpr@cavi.au.dk".install_url                        = moz "consent-o-matic";
        "{0b457cAA-602d-484a-8fe7-c1d894a011ba}".install_url = moz "fireshot";
        "{1ea2fa75-677e-4702-b06a-50fc7d06fe7e}".install_url = moz "temporary-containers-plus";
        "{b9db16a4-6edc-47ec-a1f4-b86292ed211d}".install_url = moz "video-downloadhelper";
      };
    };

    theme = {
      defaultUserChrome.enable  = false;
      defaultUserContent.enable = false;
    };
  };
}
