{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options.hyprland.enable = mkEnableOption "hyperland settings";

  config = mkIf config.hyprland.enable {
    wayland.enable = true;
    wayland.windowManager.hyprland = {
      enable = true;
      xwayland = {
        hidpi = true;
      };

      extraConfig = let
        general = ''
          general {
              gaps_in = 5
              gaps_out = 5
              border_size = 5
              layout = master
              # col.active_border = 0xff8bd5ca
              col.active_border = 0xffffffff
              # col.inactive_border = 0xff24273a
              col.inactive_border = 0xff000000
          }
        '';

        exec = ''
          exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY DISPLAY HYPRLAND_INSTANCE_SIGNATURE
          exec-once = systemctl --user start hyprland-session.target
          exec-once = v2ray run -c ~/vless-new.json
          # exec =  swaybg -i "/home/a/pretty_5.png"
          exec =  swaybg -c "#000000"
          # exec =  swww init && swww img ~/pretty_5.png
          # exec = hyprpaper
          # exec-once =  wh
          exec-once = eww -c ~/willow/home/eww/ewwConfig daemon &&  eww -c ~/willow/home/eww/ewwConfig open topbar
          # exec-once =   cat ~/vmess.json | v2ray run
        '';
        decoration = ''
          decoration {
              rounding = 5
              multisample_edges = false
          	  blurls = paper
              blur =  false
           	  drop_shadow = true
              shadow_range = 05
              shadow_offset = -5 -5
              shadow_scale = 1
              shadow_render_power = 4
              col.shadow = 0xfff5a97f
              col.shadow_inactive = 0x00000000
              dim_inactive = false
           }
        '';
        animation = ''
          animations {
            enabled=true
          }
        '';
        monitors = let
          monitorSettings = builtins.concatStringsSep "\n" [
            "monitor = eDP-1,1920x1080@60,0x0,1"
            "workspace = eDP-1,1"
          ];
        in ''
          monitors {
          ${monitorSettings}
          }
        '';
        input = let
          inputs = builtins.concatStringsSep "\n" [
            "repeat_rate = 35"
            "repeat_delay = 300"
            "kb_layout = us,ir"
            "kb_options = caps:escape"
            "sensitivity = 0.6"
            "scroll_method = edge"
          ];
        in ''
          input {
                ${inputs}
          }
        '';
        misc = let
          miscs = builtins.concatStringsSep "\n" [
            "disable_hyprland_logo = true"
            "disable_splash_rendering = true"
            "disable_autoreload = true"
          ];
        in ''
          misc {
          	  ${miscs}
             }
        '';
        gestures = let
          gestures = builtins.concatStringsSep "\n" ["workspace_swipe = true"];
        in ''
          gestures {
                 ${gestures}
          }
        '';
        window = builtins.concatStringsSep "\n" [
          "windowrule = animation popin,rofi"
        ];
        binds = let
          running = builtins.concatStringsSep "\n" [
            "bind = SUPERSHIFT,RETURN,exec,tmux-picker"
            "bind = SUPER,RETURN,exec,wezterm"
            "bind = SUPER,d,exec,rofi -show"
            "bind = SUPERSHIFT,SPACE,exec,hyprctl switchxkblayout at-translated-set-2-keyboard next"
            "bind = ,XF86MonBrightnessDown, exec, brightnessctl s 10%-"
            "bind = ,XF86MonBrightnessUp, exec, brightnessctl s 10%+"
            "binde = ,XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
            "binde = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
            "binde = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
            "bind = SUPERSHIFT,R,exec,hyprctl reload"
            "bind = SUPER,P,exec,tessen -d rofi"
          ];
          resizing = builtins.concatStringsSep "\n" [
            # will switch to a submap called resize
            "bind = SUPER,R,submap,resize"
            #will start a submap called resize
            "submap = resize"
            # sets repeatable binds for resizing the active window
            "binde = ,right,resizeactive,20 0"
            "binde = ,left,resizeactive,-20 0"
            "binde = ,up,resizeactive,0 -20"
            "binde = ,down,resizeactive,0 20"

            # use reset to go back to the global submap
            "bind = ,escape,submap,reset"

            # will reset the submap, meaning end the current one and return to the global one
            "submap = reset"
            # keybinds further down will be global again...
          ];
          management = builtins.concatStringsSep "\n" [
            "bind = SUPER,g,togglegroup"
            "bind = SUPER,SPACE,layoutmsg,swapwithmaster"
            "bind = SUPER,q,killactive"
          ];
          focusing = builtins.concatStringsSep "\n" [
            "bind = SUPER,h,movefocus,l"
            "bind = SUPER,j,movefocus,d"
            "bind = SUPER,k,movefocus,u"
            "bind = SUPER,l,movefocus,r"
          ];
          fullscreen = builtins.concatStringsSep "\n" [
            "bind = SUPER,e,fullscreen,0"
            "bind = SUPER,f,fullscreen,1"
          ];
          moving_window = builtins.concatStringsSep "\n" [
            "bind = SUPERSHIFT,h,movewindow,l"
            "bind = SUPERSHIFT,j,movewindow,d"
            "bind = SUPERSHIFT,k,movewindow,u"
            "bind = SUPERSHIFT,l,movewindow,r"
          ];
          workspace_focusing = builtins.concatStringsSep "\n" [
            "bind = SUPER,1,workspace,1"
            "bind = SUPER,2,workspace,2"
            "bind = SUPER,3,workspace,3"
            "bind = SUPER,4,workspace,4"
            "bind = SUPER,5,workspace,5"
            "bind = SUPER,6,workspace,6"
            "bind = SUPER,7,workspace,7"
            "bind = SUPER,8,workspace,8"
            "bind = SUPER,9,workspace,9"
          ];
          move_workspace = builtins.concatStringsSep "\n" [
            "bind = SUPERSHIFT,1,movetoworkspace,1"
            "bind = SUPERSHIFT,2,movetoworkspace,2"
            "bind = SUPERSHIFT,3,movetoworkspace,3"
            "bind = SUPERSHIFT,4,movetoworkspace,4"
            "bind = SUPERSHIFT,5,movetoworkspace,5"
            "bind = SUPERSHIFT,6,movetoworkspace,6"
            "bind = SUPERSHIFT,7,movetoworkspace,7"
            "bind = SUPERSHIFT,8,movetoworkspace,8"
            "bind = SUPERSHIFT,9,movetoworkspace,9"
          ];
          scratchpad = builtins.concatStringsSep "\n" [
            "bind = SUPER,GRAVE,togglespecialworkspace"
            "bind = SUPERSHIFT,GRAVE,movetoworkspace,special"
          ];

          monitor_manage = builtins.concatStringsSep "\n" [
            "bind = SUPER,comma,focusmonitor,0"
            "bind = SUPER,period,focusmonitor,1"
            "bind = SUPERSHIFT,comma,movecurrentworkspacetomonitor,0"
            "bind = SUPERSHIFT,period,movecurrentworkspacetomonitor,1"
          ];
        in let
          bindings = builtins.concatStringsSep "\n" [running resizing management focusing fullscreen moving_window workspace_focusing workspace_focusing move_workspace scratchpad monitor_manage];
        in ''
          binds {
            ${bindings}
          };
        '';
      in
        builtins.concatStringsSep "\n" [general exec decoration animation monitors input misc gestures window binds];
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
