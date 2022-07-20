{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.wm.river = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = {
    home.packages = mkIf config.wm.river.enable [
      pkgs.river
    ];
    waybar.enable = mkIf config.wm.river.enable true;
    wayland.enable = mkIf config.wm.river.enable true;
  };
}
