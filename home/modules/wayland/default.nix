{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options = {
    gui.wayland = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = {
    home.packages = with pkgs;
      mkIf config.gui.wayland.enable [
        glib #for wayland gsettings
        slurp # for wayland
        wl-clipboard
        clipman # for wayland
        brightnessctl
        grim # for wayland
        wtype
      ];
  };
}
