{
  pkgs,
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
      xwayland = {
        hidpi = false;
      };

      extraConfig = let
        general = ''
          general {
              main_mod=SUPER
              gaps_in=5
              gaps_out=10
              border_size=1
              layout=master
              col.active_border=0xfff6c177
              col.inactive_border=0xff191724
          }
        '';

        exec = ''
          exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY DISPLAY HYPRLAND_INSTANCE_SIGNATURE
          exec-once=systemctl --user start hyprland-session.target
          # exec= swaybg -i "/home/a/.config/wallpaper"
          exec= swww init && swww img ~/Downloads/sky.gif
          # exec=hyprpaper
          exec-once= wh
          # exec-once=  cat ~/vmess.json | v2ray run
        '';
        decoration = ''
          decoration {
              rounding=0
              multisample_edges= false
          	  blurls=paper
              blur= false
           	  drop_shadow=true
              shadow_range=05
              shadow_offset=-5 -5
              shadow_scale=1.0
              shadow_render_power=4
              col.shadow=0xfff6c177
              col.shadow_inactive=0x00000000
           }
        '';
        animation = ''
          animations {
            enabled=true
          }
        '';
        monitors = ''
          monitors {
            monitor=eDP-1,1920x1080@60,0x0,1
            workspace=eDP-1,1
          }
        '';
        input = ''
                    input {
           repeat_rate=35
           repeat_delay=300
           kb_layout=us,ir
           kb_options=caps:escape
           sensitivity=0.6
           scroll_method=edge
          }
        '';
        misc = ''
          misc {
           disable_hyprland_logo=true
           disable_splash_rendering=true
           disable_autoreload=true
           enable_swallow=true
          swallow_regex ="kitty"
          }
        '';
        gestures = ''
          gestures {
            workspace_swipe=true
           }
        '';
        window = ''
          windowrule=animation popin,rofi
        '';
        binds = let
          running = ''
            bind=SUPER,RETURN,exec,kitty
            bind=SUPER,d,exec,rofi -show
            bind=SUPERSHIFT,SPACE,XF86MonBrightnessDown,exec,hyprctl keyword input:kb_layout us
            bind=SUPERS,SPACE,exec,hyprctl keyword input:kb_layout ir
            bind=,XF86MonBrightnessDown, exec, brightnessctl s 10%-
            bind=,XF86MonBrightnessUp, exec, brightnessctl s 10%+
            binde=,XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
            binde=,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
            binde=,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
            bind=SUPERSHIFT,R,exec,hyprctl reload
          '';
          resizing = ''
            # will switch to a submap called resize
            bind=SUPER,R,submap,resize

            # will start a submap called "resize"
            submap=resize

            # sets repeatable binds for resizing the active window
            binde=,right,resizeactive,20 0
            binde=,left,resizeactive,-20 0
            binde=,up,resizeactive,0 -20
            binde=,down,resizeactive,0 20

            # use reset to go back to the global submap
            bind=,escape,submap,reset

            # will reset the submap, meaning end the current one and return to the global one
            submap=reset
             # keybinds further down will be global again...
          '';
          management = ''
            bind=SUPER,g,togglegroup
            bind=SUPER,SPACE,layoutmsg,swapwithmaster
            bind=SUPER,q,killactive
          '';
          focusing = ''
            bind=SUPER,h,movefocus,l
            bind=SUPER,j,movefocus,d
            bind=SUPER,k,movefocus,u
            bind=SUPER,l,movefocus,r
          '';
          fullscreen = ''
            bind=SUPER,e,fullscreen,0
            bind=SUPER,f,fullscreen,1
          '';
          moving_window = ''
            bind=SUPERSHIFT,h,movewindow,l
            bind=SUPERSHIFT,j,movewindow,d
            bind=SUPERSHIFT,k,movewindow,u
            bind=SUPERSHIFT,l,movewindow,r
          '';
          workspace_focusing = ''
            bind=SUPER,1,workspace,1
            bind=SUPER,2,workspace,2
            bind=SUPER,3,workspace,3
            bind=SUPER,4,workspace,4
            bind=SUPER,5,workspace,5
            bind=SUPER,6,workspace,6
            bind=SUPER,7,workspace,7
            bind=SUPER,8,workspace,8
            bind=SUPER,9,workspace,9
          '';
          move_workspace = ''
            bind=SUPERSHIFT,1,movetoworkspace,1
            bind=SUPERSHIFT,2,movetoworkspace,2
            bind=SUPERSHIFT,3,movetoworkspace,3
            bind=SUPERSHIFT,4,movetoworkspace,4
            bind=SUPERSHIFT,5,movetoworkspace,5
            bind=SUPERSHIFT,6,movetoworkspace,6
            bind=SUPERSHIFT,7,movetoworkspace,7
            bind=SUPERSHIFT,8,movetoworkspace,8
            bind=SUPERSHIFT,9,movetoworkspace,9
          '';
          scratchpad = ''
            bind=SUPER,GRAVE,togglespecialworkspace
            bind=SUPERSHIFT,GRAVE,movetoworkspace,special
          '';

          monitor_manage = ''
            bind=SUPER,comma,focusmonitor,0
            bind=SUPER,period,focusmonitor,1
            bind=SUPERSHIFT,comma,movecurrentworkspacetomonitor,0
            bind=SUPERSHIFT,period,movecurrentworkspacetomonitor,1
          '';
        in let
          bindings = running + resizing + management + focusing + fullscreen + moving_window + workspace_focusing + workspace_focusing + move_workspace + scratchpad + monitor_manage;
        in ''
           binds {
          ${bindings}
          };
        '';
      in
        general + exec + decoration + animation + monitors + input + misc + gestures + window + binds;
    };

    home.packages = with pkgs; [
      hyprpaper
      libseat
    ];

    home.file = {
      ".config/hypr/hyprpaper.conf" = {
        source = ./hyprpaper.conf;
      };
    };
  };
}
