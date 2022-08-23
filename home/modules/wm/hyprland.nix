{
  pkgs,
  inputs,
  config,
  lib,
  ...
}:
with lib; {
  options = {
    hyprland.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.hyprland.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      extraConfig = ''
           exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY DISPLAY HYPRLAND_INSTANCE_SIGNATURE
           exec-once=systemctl --user start hyprland-session.target
           exec-once=hyprpaper
           exec-once=eww open-many topbar topbar-monitor-two info
           exec=eww reload


           general {
               sensitivity=0.6
               main_mod=SUPER
               gaps_in=5
               gaps_out=7
               border_size=5
               damage_tracking=full
               layout=master

               col.active_border=0xfff6c177
               col.inactive_border=0xff191724
           }

           dwindle {
          force_split=2
        }

           decoration {
               rounding=1
               multisample_edges=true
           	  blurls=paper
             blur=true
         	  drop_shadow=true
               shadow_range=5
               shadow_render_power=2
               col.shadow=0xff191724
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
             follow_mouse=1 repeat_rate=35
             repeat_delay=200
           }

           misc {
             disable_hyprland_logo=true
             disable_splash_rendering=true
           }

           binds {
             bind=SUPER,RETURN,exec,kitty
             bind=SUPER,d,exec,rofi -show
             bind=SUPER,g,togglegroup

          bind=SUPER,SPACE,layoutmsg,swapwithmaster
          # bind=SUPER,j,layoutmsg,cyclenext
           # bind=SUPER,k,layoutmsg,cycleprev


             bind=SUPER,SPACE,exec,hyprctl keyword input:kb_layout "US-en"
             bind=SUPERALT,SPACE,exec,hyprctl keyword input:kb_layout "IR-fa"
             bind=SUPER,r,exec,hyprctl reload

             bind=SUPER,q,killactive


             bind=SUPER,e,fullscreen,0
             bind=SUPER,f,fullscreen,1

             bind=SUPER,h,movefocus,l
             bind=SUPER,j,movefocus,d
             bind=SUPER,k,movefocus,u
             bind=SUPER,l,movefocus,r


             bind=SUPERSHIFT,h,movewindow,l
             bind=SUPERSHIFT,j,movewindow,d
             bind=SUPERSHIFT,k,movewindow,u
             bind=SUPERSHIFT,l,movewindow,r

             bind=SUPERCTRL,h,resizeactive,-10 0
             # bind=SUPERALT,j,resizeactive,0 10
             # bind=SUPERALT,k,resizeactive,0 -10
             bind=SUPERCTRL,l,resizeactive,10 0

             # bind=SUPER,h,focusmonitor,0
             # bind=SUPER,l,focusmonitor,1

             bind=SUPER,1,workspace,1
             bind=SUPER,2,workspace,2
             bind=SUPER,3,workspace,3
             bind=SUPER,4,workspace,4
             bind=SUPER,5,workspace,5
             bind=SUPER,6,workspace,6
             bind=SUPER,7,workspace,7
             bind=SUPER,8,workspace,8
             bind=SUPER,9,workspace,9
             bind=SUPER,GRAVE,workspace,special


             bind=SUPERSHIFT,1,movetoworkspace,1
             bind=SUPERSHIFT,2,movetoworkspace,2
             bind=SUPERSHIFT,3,movetoworkspace,3
             bind=SUPERSHIFT,4,movetoworkspace,4
             bind=SUPERSHIFT,5,movetoworkspace,5
             bind=SUPERSHIFT,6,movetoworkspace,6
             bind=SUPERSHIFT,7,movetoworkspace,7
             bind=SUPERSHIFT,8,movetoworkspace,8
             bind=SUPERSHIFT,9,movetoworkspace,9

             bind=SUPER,comma,focusmonitor,0
             bind=SUPER,period,focusmonitor,1
             bind=SUPERSHIFT,comma,movecurrentworkspacetomonitor,0
             bind=SUPERSHIFT,period,movecurrentworkspacetomonitor,1
           }
      '';
    };
    home.packages = with pkgs; [
      hyprpaper
      wev
      socat
    ];
    home.file = {
      ".config/hypr/hyprpaper.conf" = {
        source = ./hyprpaper.conf;
      };
    };
  };
}
