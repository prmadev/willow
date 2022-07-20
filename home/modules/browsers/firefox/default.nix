{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options = {
    gui.browser.firefox.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = {
    programs.firefox = mkIf config.gui.browser.firefox.enable {
      # TODO customize it!
      enable = true;
      package = mkIf gui.wayland.enable pkgs.firefox-wayland.override {
        cfg = {
          enableTridactylNative = true;
        };
      };
    };
  };
}
