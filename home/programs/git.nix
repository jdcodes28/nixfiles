{ lib, pkgs, ... }: {
  programs.git = {
    enable = true;

    settings = {
      core.pager = "delta";
      interactive.diffFilter = "delta --color-only";
      merge.conflictStyle = "zdiff3";

      delta = {
        navigate     = true;
        line-numbers = true;
        hyperlinks   = true;
        side-by-side = true;
        true-color   = "always";
      };

      gpg = {
        format = "ssh";
      };

      commit = {
        gpgsign = true;
      };
    };

    includes = [];
  };
}
