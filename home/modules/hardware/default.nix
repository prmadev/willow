{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  imports = [./audio.nix ./display.nix ./keyboard.nix ./storage.nix];
  options = {
    hardware.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.hardware.enable {
    audio.enable = true;
    display.enable = true;
    keyboard.enable = true;
    storage.enable = true;
  };
}
