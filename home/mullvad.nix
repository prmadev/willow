{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.mullvad.enable = mkEnableOption "mullvad settings";
  config = mkIf config.mullvad.enable {
    home.packages = with pkgs; [
      mullvad-vpn
      # mullvad
      mullvad-closest
      mullvad-browser
    ];
  };
}
