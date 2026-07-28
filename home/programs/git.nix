{ lib, pkgs, ... }: {
  programs.git = {
    enable = true;

    settings = {
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
