{ pkgs, machineName, ... }: {
  boot.loader.limine = {
    enable = true;
    secureBoot.enable = true;
  };

  boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "25.11";
}