{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.gui.wm.river = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = {
    home.packages = mkIf config.gui.wm.river.enable [
      pkgs.river
    ];
    gui.waybar.enable = mkIf config.gui.wm.river.enable true;
    gui.wayland.enable = mkIf config.gui.wm.river.enable true;
  };
}
