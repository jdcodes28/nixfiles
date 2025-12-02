{ lib, pkgs, ... }: {
  programs.git = {
    enable = true;

    settings = {
      gpg = {
        format = "ssh";
      };

      "gpg \"ssh\"" = {
        program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
      };

      commit = {
        gpgsign = true;
      };
    };

    includes = [];
  };
}