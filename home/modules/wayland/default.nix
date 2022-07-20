{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options = {
    wayland = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = {
    home.packages = with pkgs;
      mkIf config.wayland.enable [
        glib #for wayland gsettings
        slurp # for wayland
        wl-clipboard
        clipman # for wayland
        brightnessctl
        grim # for wayland
        wtype
      ];

    programs.firefox = mkIf config.wayland.enable {
      package = pkgs.firefox-wayland;
    };
  };
}
