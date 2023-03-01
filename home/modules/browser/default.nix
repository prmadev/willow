{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  imports = [
    ./firefox
    ./qutebrowser
    ./chromium
  ];
  options = {
    browser.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.browser.enable {
    browser.firefox.enable = true;
    browser.qutebrowser.enable = false;
    home.file = {
      ".config/startpage/" = {
        source = ./startpage;
        recursive = true;
      };
    };
    home.packages = with pkgs; [
      # lynx
      # w3m
    ];
  };
}
