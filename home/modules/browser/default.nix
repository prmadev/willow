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
    browser.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = {
    browser.firefox.enable = mkIf config.browser.enable true;
    browser.qutebrowser.enable = mkIf config.browser.enable true;
    home.file = mkIf config.browser.enable {
      ".config/startpage/" = {
        source = ./startpage;
        recursive = true;
      };
    };
  };
}
