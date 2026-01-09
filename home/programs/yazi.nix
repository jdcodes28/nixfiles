{ pkgs, ... }:
let
  flexoki-dark = pkgs.fetchFromGitHub {
    owner  = "gosxrgxx";
    repo   = "flexoki-dark.yazi";
    rev    = "28e1977108e3fc79d4253db821eef1b0ae2b4c18";
    sha256 = "sha256-fEGAxeyeWD6HBKTmhAhKGNGb5LsYPR0Y2I4B5adpv9M=";
  };
  flexoki-light = pkgs.fetchFromGitHub {
    owner  = "gosxrgxx";
    repo   = "flexoki-light.yazi";
    rev    = "45eb0a0f9860eaa93146587b4d4be97b46699a38";
    sha256 = "sha256-zGx/4lJH9Cko84qcgzXu2UNJUdc4cOXMVhHQT05hpSQ=";
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

