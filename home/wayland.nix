{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options.wayland.enable = mkEnableOption "wayland settings";

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
      # evdevremapkeys
      wev
      egl-wayland
    ];

    programs.firefox = {
      package = pkgs.firefox-wayland;
    };

    home.sessionVariables = {
      QT_QPA_PLATFORM = "wayland";
      MOZ_ENABLE_WAYLAND = 1;
      SDL_VIDEODRIVER = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      _JAVA_AWT_WM_NONREPARENTING = "1";
      XKB_DEFAULT_LAYOUT = "us,ir";
      XKB_DEFAULT_OPTIONS = "grp:alt_shift_toggle,caps:escape";
    };

    systemd.user.services = {
      evdev = {
        Unit = {
          Description = "evremap remaps keys for a better experience";
        };
        Service = {
          WorkingDirectory = "/";
          ExecStart = "bash -c evremap remap /home/a/evre.toml";
          Restart = "always";
        };
        Install = {
          WantedBy = ["hyprland-session.target"];
        };
      };
    };
  };
}
