{
  lib,
  pkgs,
  ...
}: {
  programs.firefox = {
    enable = true;

    languagePacks = [ "en-US" ];

    policies = {
      AppAutoUpdate               = false;
      AutofillAddressEnabled      = false;
      AutofillCreditCardEnabled   = false;
      BackgroundAppUpdate         = false;
      BlockAboutProfiles          = true;
      BlockAboutSupport           = true;

      Containers = [
        {
          name = "Personal";
          icon = "fingerprint";
          color = "blue";
        }

        {
          name = "Work";
          icon = "briefcase";
          color = "orange";
        }

        {
          name = "Banking";
          icon = "dollar";
          color = "green";
        }

        {
          name = "Shopping";
          icon = "cart";
          color = "pink";
        }

        {
          name = "Social";
          icon = "chill";
          color = "purple";
        }
      ];

      DisableAccounts             = true;
      DisableBuiltinPDFViewer     = true;
      DisableFirefoxAccounts      = true;
      DisableFirefoxScreenshots   = true;
      DisableFirefoxStudies       = true;
      DisableFormHistory          = true;
      DisablePocket               = true;
      DisableSetDesktopBackground = true;
      DisableTelemetry            = true;
      DisplayMenuBar              = "never";

      DNSOverHTTPS = {
        Enabled = true;
        ProviderURL = "https://dns.nextdns.io/";
      };

      DontCheckDefaultBrowser     = true;
      HardwareAcceleration        = true;

      Homepage = {
        StartPage = "none";
        NewTabOnRestore = true;
      };

      HttpsOnlyMode               = "force_enabled";
      NewTabPage                  = false;
      NoDefaultBookmarks          = true;
      OfferToSaveLogins           = false;
      OverrideFirstRunPage        = "";
      PasswordManagerEnabled      = false;
      SearchSuggestEnabled        = false;

      PDFjs = {
        Enabled = false;
        EnablePermissions = false;
      };

      PromptForDownloadLocation   = true;
      SanitizeOnShutdown          = true;

      EnableTrackingProtection = {
        EmailTracking           = true;
        SuspectedFingerprinting = true;
        Cryptomining            = true;
        Fingerprinting          = true;
        Locked                  = true;
        Value                   = true;
      };

      FirefoxHome = {
        Highlights = false;
        Pocket     = false;
        Search     = true;
        Snippets   = false;
        TopSites   = false;
      };

      GenerativeAI = {
        Enabled      = false;
        Chatbot      = false;
        SmartWindow  = false;
        LinkPreviews = false;
        TabGroups    = false;
      };

      Cookies = {
        Behavior = "partition-foreign";
        BehaviorPrivateBrowsing = "partition-foreign";
        RejectTracker = true;
      };

      UserMessaging = {
        ExtensionRecommendations = false;
        MoreFromMozilla          = false;
        SkipOnboarding           = true;
      };

      ExtensionSettings = let
        moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";

        mkExtension = { id, slug, installation_mode ? "force_installed", updates_disabled ? true }: {
          name = id;
          value = {
            install_url = moz slug;
            inherit installation_mode updates_disabled;
          };
        };

        extensionList = [
          {
            id   = "uBlock0@raymondhill.net";
            slug = "ublock-origin";
          }

          {
            id   = "{1ea2fa75-677e-4702-b06a-50fc7d06fe7e}";
            slug = "temporary-containers-plus";
          }

          {
            id   = "{446900e4-71c2-419f-a6a7-df9c091e268b}";
            slug = "bitwarden-password-manager";
          }

          {
            id   = "gdpr@cavi.au.dk";
            slug = "consent-o-matic";
          }

          {
            id   = "browser-extension@anonaddy";
            slug = "addy_io";
          }

          {
            id   = "{0b457cAA-602d-484a-8fe7-c1d894a011ba}";
            slug = "fireshot";
          }

          {
            id   = "{b9db16a4-6edc-47ec-a1f4-b86292ed211d}";
            slug = "video-downloadhelper";
          }
        ];
      in
        { "*".installation_mode = "blocked"; }
        // builtins.listToAttrs (map mkExtension extensionList);

      "3rdparty".Extensions = {
        "uBlock0@raymondhill.net".adminSettings = {
          userSettings = rec {
            cloudStorageEnabled = false;

            importedLists = [
              "https://filters.adtidy.org/extension/ublock/filters/3.txt"
              "https://github.com/DandelionSprout/adfilt/raw/master/LegitimateURLShortener.txt"
            ];
            externalLists = lib.concatStringsSep "\n" importedLists;
          };

          selectedFilterLists = [
            "CZE-0" "adguard-generic" "adguard-annoyance" "adguard-social"
            "adguard-spyware-url" "easylist" "easyprivacy"
            "https://github.com/DandelionSprout/adfilt/raw/master/LegitimateURLShortener.txt"
            "plowe-0" "ublock-abuse" "ublock-badware" "ublock-filters"
            "ublock-privacy" "ublock-quick-fixes" "ublock-unbreak" "urlhaus-1"
          ];
        };
      };
    };

    profiles.default.settings = {
      "app.normandy.enabled" = false;
      "app.shield.optoutstudies.enabled" = false;
      "browser.aboutConfig.showWarning" = false;
      "browser.cache.disk.enable" = false;
      "browser.contentblocking.category" = "strict";
      "browser.newtabpage.enabled" = false;
      "browser.places.speculativeConnect.enabled" = false;
      "browser.send_pings" = false;
      "browser.sessionstore.privacy_level" = 2;
      "browser.startup.page" = 0;
      "browser.uiCustomization.state" = builtins.readFile ./toolbar.json;
      "browser.uitour.enabled" = false;
      "datareporting.healthreport.uploadEnabled" = false;
      "datareporting.policy.dataSubmissionEnabled" = false;
      "device.sensors.enabled" = false;
      "devtools.debugger.remote-enabled" = false;
      "dom.battery.enabled" = false;
      "dom.event.clipboardevents.enabled" = false;
      "dom.gamepad.enabled" = false;
      "dom.security.https_only_mode" = true;
      "extensions.enabledScopes" = 5;
      "extensions.formautofill.addresses.enabled" = false;
      "extensions.formautofill.creditCards.enabled" = false;
      "extensions.postDownloadThirdPartyPrompt" = false;
      "extensions.update.enabled" = false;
      "general.smoothScroll" = false;
      "geo.enabled" = false;
      "geo.provider.use_geoclue" = false;
      "javascript.enabled" = true;
      "media.peerconnection.ice.default_address_only" = true;
      "media.peerconnection.ice.no_host" = true;
      "network.dns.disablePrefetch" = true;
      "network.http.referer.XOriginTrimmingPolicy" = 2;
      "network.http.sendRefererHeader" = 2;
      "network.http.speculative-parallel-limit" = 0;
      "network.predictor.enabled" = false;
      "network.proxy.socks_remote_dns" = true;
      "network.trr.custom_uri" = "https://dns.nextdns.io/";
      "network.trr.mode" = 3;
      "permissions.default.shortcuts" = 2;
      "privacy.query_stripping.strip_list" = "__hsfp __hssc __hstc __s _hsenc _openstat dclid fbclid gbraid gclid hsCtaTracking igshid mc_eid ml_subscriber ml_subscriber_hash msclkid oft_c oft_ck oft_d oft_id oft_ids oft_k oft_lk oft_sk oly_anon_id oly_enc_id rb_clickid s_cid twclid vero_conv vero_id wbraid wickedid yclid";
      "privacy.resistFingerprinting" = true;
      "privacy.resistFingerprinting.letterboxing" = true;
      "privacy.spoof_english" = 1;
      "privacy.trackingprotection.cryptomining.enabled" = true;
      "privacy.trackingprotection.fingerprinting.enabled" = true;
      "privacy.userContext.enabled" = true;
      "privacy.userContext.newTabContainerOnLeftClick.enabled" = true;
      "privacy.userContext.ui.enabled" = true;
      "security.OCSP.require" = true;
      "security.cert_pinning.enforcement_level" = 2;
      "security.ssl.require_safe_negotiation" = true;
      "security.tls.enable_0rtt_data" = false;
      "security.tls.version.min" = 3;
      "signon.autofillForms" = false;
      "signon.rememberSignons" = false;
      "toolkit.telemetry.enabled" = false;
      "toolkit.telemetry.server" = "data:,";
      "webgl.disabled" = false;
    };

    profiles.default.search = {
      force          = true;
      default        = "Kagi";
      privateDefault = "Kagi";

      engines = {
        "Nixpkgs" = {
          urls = [{
            template = "https://search.nixos.org/packages";

            params = [
              { name = "channel"; value = "unstable"; }
              { name = "query";   value = "{searchTerms}"; }
            ];
          }];
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "!np" ];
        };

        "Nix Options" = {
          urls = [{
            template = "https://search.nixos.org/options";

            params = [
              { name = "channel"; value = "unstable"; }
              { name = "query";   value = "{searchTerms}"; }
            ];
          }];
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "!no" ];
        };

        "NixOS Wiki" = {
          urls = [{
            template = "https://wiki.nixos.org/w/index.php";
            params = [{ name = "search"; value = "{searchTerms}"; }];
          }];
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "!nw" ];
        };
      };
    };
  };
}


