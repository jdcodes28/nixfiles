{ pkgs, ... }: {
  programs.obs-studio.plugins = with pkgs.obs-studio-plugins; [
    obs-vaapi
  ];
}
