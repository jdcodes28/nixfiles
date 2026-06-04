{
  config,
  pkgs,
  ...
}: {
  boot.loader.limine = {
    enable = true;
    secureBoot.enable = true;
  };

  boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
  boot.loader.efi.canTouchEfiVariables = true;

  environment.variables = {
    LIBVA_DRIVER_NAME         = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    GBM_BACKEND               = "nvidia-drm";
    NVD_BACKEND               = "direct";
  };

  hardware = {
    graphics = {
      extraPackages = with pkgs; [
        egl-wayland
        nvidia-vaapi-driver
      ];
    };

    nvidia = {
      open = true;
      modesetting.enable = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  system.stateVersion = "26.05";
}
