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

  config = mkIf config.wayland.enable {
    home.packages = with pkgs; [
      glib #for wayland gsettings
      slurp # for wayland
      wl-clipboard
      clipman # for wayland
      brightnessctl
      grim # for wayland
      wtype
      swaybg
      wev
    ];

    programs.firefox = {
      package = pkgs.firefox-wayland;
    };

    home.sessionVariables = {
      QT_QPA_PLATFORM = "wayland";
      MOZ_ENABLE_WAYLAND = 1;
      SDL_VIDEODRIVER = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    };
  };
}
