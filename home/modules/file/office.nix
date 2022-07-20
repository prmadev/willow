{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options = {
    office.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.office.enable {
    home.packages = with pkgs; [
      libreoffice
    ];
  };
}
