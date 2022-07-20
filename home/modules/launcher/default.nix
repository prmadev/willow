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
  options.launcher = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = ''
        If enabled, installs the launcher.
      '';
    };
  };
  config = {
    launcher.rofi = mkIf config.launcher.enable {
      enable = true;
    };
  };
}
