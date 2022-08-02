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
        repeat_rate=35
        repeat_delay=200
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

        bind=SUPERALT,h,resizeactive,-10 0
        bind=SUPERALT,j,resizeactive,0 -10
        bind=SUPERALT,k,resizeactive,10 0
        bind=SUPERALT,l,resizeactive,0 10


        bind=SUPER,1,workspace,1
        bind=SUPER,2,workspace,2
        bind=SUPER,3,workspace,3
        bind=SUPER,4,workspace,4
        bind=SUPER,5,workspace,5
        bind=SUPER,6,workspace,6
        bind=SUPER,7,workspace,7
        bind=SUPER,8,workspace,8
        bind=SUPER,9,workspace,9


        bind=SUPERSHIFT,1,movetoworkspace,1
        bind=SUPERSHIFT,2,movetoworkspace,2
        bind=SUPERSHIFT,3,movetoworkspace,3
        bind=SUPERSHIFT,4,movetoworkspace,4
        bind=SUPERSHIFT,5,movetoworkspace,5
        bind=SUPERSHIFT,6,movetoworkspace,6
        bind=SUPERSHIFT,7,movetoworkspace,7
        bind=SUPERSHIFT,8,movetoworkspace,8
        bind=SUPERSHIFT,9,movetoworkspace,9

      }
    '';
  };
  home.packages = with pkgs; [
    wev
  ];
}
