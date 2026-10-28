{
  pkgs,
  lib,
  packages,
  win2xcur-src,
}:

let
  win2xcur = pkgs.win2xcur.overrideAttrs (old: {
    src = win2xcur-src;

    version =
      let d = win2xcur-src.lastModifiedDate;
      in "0.2.1-unstable-${lib.substring 0 4 d}-${lib.substring 4 2 d}-${lib.substring 6 2 d}";
  });

  mkShadowCursor =
    base:
    pkgs.stdenv.mkDerivation {
      pname = "${base.pname or base.name}-shadow";
      version = base.version or "shadow";
      nativeBuildInputs = [ win2xcur ];
      dontUnpack = true;

      buildPhase = ''
        runHook preBuild
        shopt -s nullglob extglob

        for cursor_dir in "${base}"/share/icons/*/cursors; do
          [ -d "$cursor_dir" ] || continue
          theme="$(basename "$(dirname "$cursor_dir")")"
          mkdir -p "windows/$theme" "shadowed/$theme"

          for f in "$cursor_dir"/*; do
            if [ -L "$f" ]; then
              cp -P "$f" "shadowed/$theme/"
            elif [ -f "$f" ]; then
              x2wincur "$f" -o "windows/$theme/" || true
            fi
          done

          win2xcur -s -O 90 "windows/$theme"/*.@(cur|ani) -o "shadowed/$theme/" || true
        done

        runHook postBuild
      '';

      installPhase = ''
        runHook preInstall
        shopt -s nullglob

        for theme_dir in shadowed/*; do
          [ -d "$theme_dir" ] || continue
          theme="$(basename "$theme_dir")"
          src_theme="${base}/share/icons/$theme"

          mkdir -p "$out/share/icons/$theme/cursors"
          for meta in index.theme cursor.theme; do
            [ -f "$src_theme/$meta" ] && cp "$src_theme/$meta" "$out/share/icons/$theme/$meta"
          done
          cp -P "$theme_dir"/* "$out/share/icons/$theme/cursors/" || true
        done

        runHook postInstall
      '';
    };
in
pkgs.symlinkJoin {
  name = "cursors-shadow";
  paths = map mkShadowCursor packages;
}
