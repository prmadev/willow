{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  imports = [
    ./rofi
  ];
  options.gui.launcher = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = ''
        If enabled, installs the launcher.
      '';
    };
  };
  config = {
    gui.launcher.rofi = mkIf config.gui.launcher.enable {
      enable = true;
    };
  };
}
