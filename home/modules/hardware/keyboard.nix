{
  lib,
  config,
  ...
}:
with lib; {
  options = {
    keyboard.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config =
    mkIf config.keyboard.enable {};
}
