{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options = {
    browser.firefox.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = {
    programs.firefox = mkIf config.browser.firefox.enable {
      enable = true;
    };
  };
}
