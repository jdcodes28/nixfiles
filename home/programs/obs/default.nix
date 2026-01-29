{ machine, pkgs, ... }: {
  programs.obs-studio = {
    enable = true;

    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
      obs-vkcapture
    ];
  };

  imports = [
    ./${machine}.nix
  ];
}
