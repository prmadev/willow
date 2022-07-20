{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    monitor.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.monitor.enable {
    home.packages = with pkgs; [
      mprocs
      xorg.xwininfo
    ];
  };
}
