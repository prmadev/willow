{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  imports = [
    ./firefox
    ./qutebrowser
    # ./chromium
  ];
  options = {
    gui.browser.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = {
    gui.browser.firefox.enable = mkIf config.gui.browser.enable true;
    gui.browser.qutebrowser.enable = mkIf config.gui.browser.enable true;
    home.file = mkIf config.gui.browser.enable {
      ".config/startpage/" = {
        source = ./startpage;
        recursive = true;
      };
    };
  };
}
