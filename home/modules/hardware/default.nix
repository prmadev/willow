{
  lib,
  config,
  ...
}:
with lib; {
  imports = [./audio.nix ./storage.nix];
  options = {
    hardware.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.hardware.enable {
    audio.enable = true;
    storage.enable = true;
  };
}
