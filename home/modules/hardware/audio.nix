{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    audio.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.audio.enable {
    home.packages = with pkgs; [
      pavucontrol
      playerctl
      pulsemixer
    ];
  };
}
