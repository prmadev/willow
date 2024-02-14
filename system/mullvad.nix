{pkgs, ...}: {
  services.mullvad-vpn = {
    package = pkgs.mullvad-vpn;
    enable = true;
  };
}
