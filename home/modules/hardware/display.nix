{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    display.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config =
    mkIf config.display.enable {
    };
}
