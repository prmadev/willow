{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  imports = [
    ./river
    ./waybar
    ./mako
  ];

  options.gui.wm = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = {
    gui.mako = mkIf config.gui.wm.enable {
      enable = true;
    };
    gui.launcher = mkIf config.gui.wm.enable {
      enable = true;
    };

    gui.wm.river = mkIf config.gui.wm.enable {
      enable = true;
    };
  };
}
