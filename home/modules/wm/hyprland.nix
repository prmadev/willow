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
      decoration {
        rounding=5
        multisample_edges=true
      }
      animations {
        enabled=true
      }

      input {
        follow_mouse=1
        repeat_rate=100
        repeat_delay=100
      }
      misc {
        disable_hyprland_logo=true
        disable_splash_rendering=true
      }
      binds {
        bind=SUPER,RETURN,exec,kitty


      bind=SUPER,q,killactive


        bind=SUPER,f,fullscreen,0
        bind=SUPER,e,fullscreen,1

        bind=SUPER,h,movefocus,l
        bind=SUPER,j,movefocus,d
        bind=SUPER,k,movefocus,u
        bind=SUPER,l,movefocus,r


        bind=SUPERSHIFT,h,movewindow,l
        bind=SUPERSHIFT,j,movewindow,d
        bind=SUPERSHIFT,k,movewindow,u
        bind=SUPERSHIFT,l,movewindow,r

      }
    '';
  };
  home.packages = with pkgs; [
    wev
  ];
}
