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
      enable = true;
    };
  };
}
