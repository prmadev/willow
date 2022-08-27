{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options = {
    hoard.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.hoard.enable {
    home.packages = with pkgs; [
      hoard
    ];
  };
}
