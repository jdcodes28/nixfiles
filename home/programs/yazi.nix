{ pkgs, ... }:
let
  flexoki-dark = pkgs.fetchFromGitHub {
    owner  = "gosxrgxx";
    repo   = "flexoki-dark.yazi";
    rev    = "25d28ce199a5189dbad5d17a526d0ebdece63532";
    sha256 = "sha256-z8USdFAWqDl+8+aM83Hy0Wjjkdq62LC5PwcVpDMOWWY=";
  };
  flexoki-light = pkgs.fetchFromGitHub {
    owner  = "gosxrgxx";
    repo   = "flexoki-light.yazi";
    rev    = "1b1e67795a3eeec51aec0be74b3d76316be9aaa1";
    sha256 = "sha256-yIYkgGeYHl3/iRrKzsPnh2nw0PwPD/LYm1BQMy/yvBw=";
  };
in
{
  programs.yazi = {
    enable = true;

    theme = {
      flavor = {
        dark  = "flexoki-dark";
        light = "flexoki-light";
      };
    };

    flavors = {
      flexoki-light = "${flexoki-light}";
      flexoki-dark  = "${flexoki-dark}";
    };
  };
}

