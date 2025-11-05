{ lib, pkgs, ... }: {
  programs.git = {
    enable = true;

    extraConfig = {
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