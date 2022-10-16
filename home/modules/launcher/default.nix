{
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
    };
  };
  config = mkIf config.launcher.enable {
    launcher.rofi = {
      enable = true;
    };
  };
}
