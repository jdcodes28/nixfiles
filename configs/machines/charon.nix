{
  pkgs,
  ...
}: {
  boot.loader.limine = {
    enable = true;
    maxGenerations = 10;
    secureBoot.enable = true;
  };

  boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.bluetooth.enable = true;

  services = {
    mullvad-vpn.enable = true;
    upower.enable = true;
  };

  time.timeZone = "America/Chicago";

  system.stateVersion = "26.05";
}
