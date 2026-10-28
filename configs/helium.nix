{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
let
  hasNvidia = builtins.elem "nvidia" (config.services.xserver.videoDrivers or [ ]);
  base = inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default;

  heliumPkg =
    if hasNvidia then
      pkgs.symlinkJoin {
        name = "helium-nvidia";
        paths = [ base ];
        nativeBuildInputs = [ pkgs.makeWrapper ];
        postBuild = ''
          wrapProgram $out/bin/helium \
            --set NVD_SINGLE_BUFFER 1
        '';
        meta = (base.meta or { }) // { mainProgram = "helium"; };
      }
    else
      base;
in
{
  imports = [
    inputs.helium.nixosModules.helium
  ];

  programs.helium = {
    enable = true;
    package = heliumPkg;
    flags = lib.optionals hasNvidia [
      "--enable-features=WaylandWindowDecorations,AcceleratedVideoDecodeLinuxGL,VaapiOnNvidiaGPUs"
    ];

    extensions = {
      ublock = {
        id      = "blockjmkbacgjkknlgpkjjiijinjdanf";
        pin     = true;
        install = false;
      };

      bitwarden = {
        id  = "nngceckbapebfimnlniiiahkandclblb";
        pin = true;
      };

      addy = {
        id  = "iadbdpnoknmbdeolbapdackdcogdmjpe";
        pin = true;
      };

      xposed = {
        id  = "oodhljjldjdhcdopjpmfgbaoibpancfk";
        pin = true;
      };

      phantom = {
        id  = "bfnaelmomeimhlpmgjnjophhpkkoljpa";
        pin = true;
      };
    };

    preferences = {
      browser = {
        show_forward_button = false;
      };

      helium = {
        completed_onboarding = true;
        services.user_consented = true;

        browser = {
          centered_location_bar = false;
          layout = 1;
          show_avatar_button = false;
          show_back_button = false;
          show_reload_button = false;
          rounded_frame = false;
          zen_mode = false;
        };
      };
    };

    extraPolicies = {
      ManagedBookmarks =
        let
          mkFolder = name: children: { inherit name children; };

          mkBookmark = name: url: { inherit name url; };

          mkScriptlet =
            name: javascript:
            mkBookmark name (
              "javascript:"
              + "{${javascript}}"
              + "void 0;"
            );

          mkIndication = text: /* javascript */ ''
            {
              const indication = document.body.appendChild(
                document.createElement("div")
              );

              indication.textContent = ${text};

              Object.assign(indication.style, {
                position: "fixed",
                top: "0",
                left: "0",
                zIndex: "2147483647",
                padding: "8px 16px",
                borderRadius: "8px",
                colorScheme: "light dark",
                background: "Canvas",
                color: "CanvasText",
                font: "14px/1 system-ui",
                pointerEvents: "none",
              });

              indication.animate(
                [
                  { opacity: 1, offset: 0.6, easing: "cubic-bezier(0.4, 0, 0.2, 1)" },
                  { opacity: 0, offset: 1 },
                ],
                { duration: 1500, fill: "forwards" },
              )
              .finished
              .then(() => indication.remove());
            }
          '';
        in
        [
          { toplevel_name = "Tools"; }

          # Archive
          (mkFolder "Archive" [
            (mkFolder "Wayback" [
              (mkScriptlet "View" /* javascript */ ''
                window.open("https://web.archive.org/web/*/" + location.href);
              '')

              (mkScriptlet "Save" /* javascript */ ''
                window.open("https://web.archive.org/save/" + location.href);
              '')
            ])

            (mkFolder "Archive.is" [
              (mkScriptlet "View" /* javascript */ ''
                window.open("https://archive.ph/newest/" + location.href);
              '')

              (mkScriptlet "Save" /* javascript */ ''
                window.open(
                  "https://archive.ph/?run=1&url=" + encodeURIComponent(location.href)
                );
              '')
            ])
          ])

          # Reverse Image Search
          (mkFolder "Reverse Image" (
            let
              mkReverse =
                name: prefix:
                mkScriptlet name /* javascript */ ''
                  document.addEventListener("click", function handler(event) {
                    const image = event.target instanceof Element
                      ? event.target.closest("img")
                      : null;

                    if (!image) return;

                    event.preventDefault();
                    event.stopPropagation();
                    document.removeEventListener("click", handler, true);

                    window.open(
                      "${prefix}" + encodeURIComponent(image.currentSrc || image.src)
                    );
                  }, true);
                '';
            in
            [
              (mkReverse "Yandex" "https://yandex.com/images/search?rpt=imageview&url=")
              (mkReverse "Google Lens" "https://lens.google.com/uploadbyurl?url=")
              (mkReverse "Bing" "https://www.bing.com/images/search?view=detailv2&iss=sbi&q=imgurl:")
              (mkReverse "TinEye" "https://www.tineye.com/search?url=")
            ]
          ))

          # Tweet to Image
          (mkScriptlet "Tweet to Image" /* javascript */ ''
            const host = location.hostname.replace(/^(www|mobile)\./i, "").toLowerCase();
            const match = location.pathname.match(/^\/([^/]+)\/status\/(\d+)(?:\/|$)/);

            if ((host === "x.com" || host === "twitter.com") && match) {
              const tweetUrl = "https://x.com/" + match[1] + "/status/" + match[2];

              window.open(
                "https://api.proxynova.com/v1/tweet2image?format=redirect&url=" +
                  encodeURIComponent(tweetUrl)
              );
            } else {
              alert("Open an X/Twitter post first.");
            }
          '')

          # Nuke
          (mkFolder "Nuke" [
            (mkScriptlet "Sticky Elements" /* javascript */ ''
              document.querySelectorAll("body *").forEach((element) => {
                const position = getComputedStyle(element).position;

                if (position === "fixed" || position === "sticky") {
                  element.remove();
                }
              });

              document.documentElement.style.overflow = "auto";
              document.body.style.overflow = "auto";
            '')

            (mkScriptlet "Remove Images" /* javascript */ ''
              document.querySelectorAll("img").forEach((image) => {
                image.replaceWith(document.createTextNode(image.alt));
              });
            '')
          ])

          # Toggle
          (mkFolder "Toggle" [
            (mkScriptlet "Password Inputs" /* javascript */ ''
              let shown = false;

              document.querySelectorAll("input").forEach((input) => {
                if (input.type === "password") {
                  input.dataset.wasPassword = "";
                  input.type = "text";
                  shown = true;
                } else if ("wasPassword" in input.dataset) {
                  delete input.dataset.wasPassword;
                  input.type = "password";
                }
              });

              ${mkIndication /* js */ ''"Passwords " + (shown ? "shown" : "hidden")''}
            '')

            (mkScriptlet "Design Mode" /* javascript */ ''
              document.designMode = document.designMode === "on" ? "off" : "on";

              ${mkIndication /* js */ ''"Design mode " + document.designMode''}
            '')

            (mkScriptlet "Selections" /* javascript */ ''
              const enabler = (window.__forceSelection ??= Object.assign(
                document.createElement("style"),
                {
                  textContent: `
                    *, *::before, *::after {
                      user-select: text !important;
                    }
                    [data-force-selection-before]::before {
                      content: none !important;
                    }
                    [data-force-selection-after]::after {
                      content: none !important;
                    }
                  `,
                  stop: (event) => event.stopPropagation(),
                }
              ));

              const events = [
                "copy", "cut", "paste",
                "selectstart", "contextmenu", "dragstart"
              ];

              if (!enabler.isConnected) {
                document.head.appendChild(enabler);

                events.forEach((eventName) => {
                  document.addEventListener(eventName, enabler.stop, true);
                });

                // Convert CSS-generated text into selectable elements.
                document.querySelectorAll("*").forEach((element) => {
                  [
                    ["::before", "data-force-selection-before", "afterbegin"],
                    ["::after", "data-force-selection-after", "beforeend"],
                  ].forEach(([pseudo, attribute, position]) => {
                    const content = getComputedStyle(element, pseudo)
                      .content.match(/^"(.*)"$/s)?.[1];

                    if (content == null) return;

                    element.setAttribute(attribute, "");

                    element.insertAdjacentElement(
                      position,
                      Object.assign(document.createElement("span"), {
                        className: "force-selection-pseudo",
                        textContent: content,
                      })
                    );
                  });
                });
              } else {
                enabler.remove();

                events.forEach((eventName) => {
                  document.removeEventListener(eventName, enabler.stop, true);
                });

                document.querySelectorAll(".force-selection-pseudo")
                  .forEach((span) => span.remove());

                document.querySelectorAll(
                  "[data-force-selection-before], [data-force-selection-after]"
                ).forEach((element) => {
                  element.removeAttribute("data-force-selection-before");
                  element.removeAttribute("data-force-selection-after");
                });
              }

              ${mkIndication /* js */ ''"Selections " + (enabler.isConnected ? "enabled" : "disabled")''}
            '')

            (mkScriptlet "Grayscale Page" /* javascript */ ''
              const root = document.documentElement;
              const filter = "grayscale(1)";
              const enabled = root.style.filter !== filter;

              root.style.filter = enabled ? filter : "";

              ${mkIndication /* js */ ''"Grayscale " + (enabled ? "enabled" : "disabled")''}
            '')

            (mkScriptlet "Invert Page" /* javascript */ ''
              const root = document.documentElement;
              const filter = "invert(90%) contrast(120%) brightness(105%)";
              const enabled = root.style.filter !== filter;

              root.style.filter = enabled ? filter : "";

              ${mkIndication /* js */ ''"Inversion " + (enabled ? "enabled" : "disabled")''}
            '')
          ])
        ];
    };
  };
}
