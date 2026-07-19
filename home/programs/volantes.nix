{ pkgs, lib, ... }:

let
  base = pkgs.volantes-cursors;
  themes = [ "volantes_cursors" "volantes_light_cursors" ];
in
pkgs.stdenv.mkDerivation {
  pname = "volantes-cursors-shadow";
  version = "shadow";
  nativeBuildInputs = [ pkgs.win2xcur ];
  dontUnpack = true;

  buildPhase = ''
    runHook preBuild
    shopt -s nullglob extglob

    ${builtins.concatStringsSep "\n" (map (theme: ''
      if [ ! -d ${base}/share/icons/${theme}/cursors ]; then
        echo "WARNING: skipping ${theme} — source directory not found" >&2
      else
        mkdir -p "windows/${theme}" "shadowed/${theme}"
        for f in ${base}/share/icons/${theme}/cursors/*; do
          [ -f "$f" ] || continue
          x2wincur "$f" -o "windows/${theme}/" || true
        done
        win2xcur -s "windows/${theme}"/*.@(cur|ani) -o "shadowed/${theme}/" || true
      fi
    '') themes)}

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    ${builtins.concatStringsSep "\n" (map (theme: ''
      if [ -d ${base}/share/icons/${theme} ]; then
        mkdir -p "$out/share/icons/${theme}/cursors"
        cp ${base}/share/icons/${theme}/index.theme "$out/share/icons/${theme}/index.theme" || true
        cp ${base}/share/icons/${theme}/cursor.theme "$out/share/icons/${theme}/cursor.theme" || true
        [ -n "$(ls -A shadowed/${theme} 2>/dev/null)" ] && cp shadowed/${theme}/* "$out/share/icons/${theme}/cursors/"
      fi
    '') themes)}

    runHook postInstall
  '';
}
