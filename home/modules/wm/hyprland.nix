{
  pkgs,
  inputs,
  config,
  lib,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
            exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY DISPLAY HYPRLAND_INSTANCE_SIGNATURE
            exec-once=systemctl --user start hyprland-session.target
            # exec-once=swaybg -i ~/.config/wallpaper.jpg
            # exec-once=xprop -root -f _XWAYLAND_GLOBAL_OUTPUT_SCALE 32c -set _XWAYLAND_GLOBAL_OUTPUT_SCALE 2

      general {
            sensitivity=0.6
            main_mod=SUPER
            gaps_in=5
            gaps_out=5
            border_size=3
            damage_tracking=full
          }

      input {
        follow_mouse=1
      }
      misc {
        disable_hyprland_logo=true
        disable_splash_rendering=true
      }
      binds {
        bind=SUPER,RETURN,exec,kitty
      }
    '';
  };
  home.packages = with pkgs; [
    wev
  ];
}
