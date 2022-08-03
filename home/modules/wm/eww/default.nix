{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options = {
    eww.enable = mkOption {
      type = types.bool;
      default = true;
    };
  };
  config = mkIf config.eww.enable {
    home.packages = with pkgs; [
      eww-wayland
    ];
  };
}
