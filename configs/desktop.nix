{ pkgs, ... }: {
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware = {
    graphics = {
      enable = true;

      extraPackages = with pkgs; [
        egl-wayland
        nvidia-vaapi-driver
      ];
    };

    nvidia = {
      open = true;
      modesetting.enable = true;
    };
  };

  environment.variables = {
    LIBVA_DRIVER_NAME         = "nvidia";
    VDPAU_DRIVER              = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    GBM_BACKEND               = "nvidia-drm";
    NVD_BACKEND               = "direct";
    WLR_NO_HARDWARE_CURSORS   = "1";
  };
}
