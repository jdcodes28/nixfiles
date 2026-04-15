{ pkgs, ... }: {
  hardware.bluetooth.enable = true;

  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn;
  };

  services.upower.enable = true;
}