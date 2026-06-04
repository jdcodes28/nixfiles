{
  pkgs,
  ...
}: {
  boot.loader.limine = {
    enable = true;
    secureBoot.enable = true;
  };

  boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.bluetooth.enable = true;

  services = {
    mullvad-vpn.enable = true;
    upower.enable = true;
  };

  system.stateVersion = "26.05";
}
