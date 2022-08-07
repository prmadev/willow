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
      exec-once=swaybg -i "~/Pictures/wallpaper/wall1.jpg"
      exec-once=eww open topbar

      general {
          sensitivity=0.6
          main_mod=SUPER
          gaps_in=5
          gaps_out=5
          border_size=3
          damage_tracking=full
          #layout=master

          col.active_border=0xff31748f
          col.inactive_border=0xff191724
      }

      decoration {
          rounding=1
          multisample_edges=true
      }

      animations {
        enabled=true
      }

      monitors {
        monitor=eDP-1,1366x768@60,0x0,1
        workspace=eDP-1,1
        monitor=DP-1,1600x900@60,1366x0,1
        workspace=DP-1,9
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
        bind=SUPER,d,exec,rofi -show


        bind=SUPER,space,exec,hyprctl keyword input:kb_layout "US-en"
        bind=SUPERALT,space,exec,hyprctl keyword input:kb_layout "IR-fa"

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


        bind=SUPERSHIFT,exclam,movetoworkspace,1
        bind=SUPERSHIFT,at,movetoworkspace,2
        bind=SUPERSHIFT,numbersign,movetoworkspace,3
        bind=SUPERSHIFT,dollar,movetoworkspace,4
        bind=SUPERSHIFT,percent,movetoworkspace,5
        bind=SUPERSHIFT,asciicircum,movetoworkspace,6
        bind=SUPERSHIFT,ampersand,movetoworkspace,7
        bind=SUPERSHIFT,parenleft,movetoworkspace,8
        bind=SUPERSHIFT,parenright,movetoworkspace,9

        bind=SUPER,comma,focusmonitor,l
        bind=SUPER,period,focusmonitor,r
        bind=SUPERSHIFT,less,movecurrentworkspacetomonitor,l
        bind=SUPERSHIFT,greater,movecurrentworkspacetomonitor,r
      }
    '';
  };
  home.packages = with pkgs; [
    wev
  ];
}
