{
  pkgs,
  lib,
  config,
  # inputs,
  ...
}:
# configData =
#   pkgs.writeTextFile
#   {
#     name = "workstyle.toml";
#     # text = inputs.nix-std.lib.serde.toTOML {
#     #   "github" = "";
#     # };
#     destination = "";
#   };
with lib; {
  options.sway = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
    borderAndGap = mkOption {
      type = types.int;
      default = 5;
    };
  };
  config = mkIf config.sway.enable {
    home.packages = with pkgs; [
      swayr
      # swaywsr
      sway-contrib.grimshot
      workstyle
    ];

    wayland.enable = true;
    wayland.windowManager.sway = let
      c = config.colors.macchiato;
    in {
      enable = true;
      systemd.enable = true;
      extraSessionCommands = ''
        export SDL_VIDEODRIVER=wayland
        # needs qt5.qtwayland in systemPackages
        export QT_QPA_PLATFORM=wayland
        export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
        # Fix for some Java AWT applications (e.g. Andro>
        # use this if they aren't displayed properly:
        export _JAVA_AWT_WM_NONREPARENTING=1
      '';
      config = {
        seat = {
          "*" = {
            hide_cursor = "when-typing disable";
          };
        };
        bars = [
          {
            colors = {
              background = c.base.hex;
              statusline = c.text.hex;
              separator = c.text.hex;
              focusedBackground = c.base.hex;
              focusedStatusline = c.text.hex;
              focusedSeparator = c.text.hex;
              urgentWorkspace = {
                background = c.base.hex;
                border = c.maroon.hex;
                text = c.text.hex;
              };
              focusedWorkspace = {
                background = c.text.hex;
                border = c.text.hex;
                text = c.base.hex;
              };
              activeWorkspace = {
                background = c.base.hex;
                border = c.text.hex;
                text = c.text.hex;
              };
              inactiveWorkspace = {
                background = c.base.hex;
                border = c.base.hex;
                text = c.text.hex;
              };
              bindingMode = {
                background = c.base.hex;
                border = c.base.hex;
                text = c.text.hex;
              };
            };
            fonts = {
              names = ["Monaspace Krypton"];
              style = "Bold";
              size = 15.0;
            };
            id = "top";
            position = "top";
            trayPadding = config.sway.borderAndGap;
            workspaceButtons = true;
            workspaceNumbers = true;
            statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs config-default";
            extraConfig = ''
              gaps 10
              workspace_min_width 10
            '';
          }
        ];

        colors = {
          background = c.base.hex;
          focused = {
            background = c.text.hex;
            border = c.text.hex;
            childBorder = c.text.hex;
            indicator = c.overlay0.hex;
            text = c.base.hex;
          };
          focusedInactive = {
            background = c.base.hex;
            border = c.base.hex;
            childBorder = c.base.hex;
            indicator = c.base.hex;
            text = c.base.hex;
          };

          placeholder = {
            background = c.surface0.hex;
            border = c.surface0.hex;
            childBorder = c.overlay0.hex;
            indicator = c.overlay0.hex;
            text = c.text.hex;
          };

          unfocused = {
            background = c.base.hex;
            border = c.text.hex;
            childBorder = c.base.hex;
            indicator = c.base.hex;
            text = c.text.hex;
          };
          urgent = {
            background = c.red.hex;
            border = c.red.hex;
            childBorder = c.red.hex;
            indicator = c.red.hex;
            text = c.base.hex;
          };
        };
        floating.border = config.sway.borderAndGap;
        focus = {
          followMouse = "always";
          mouseWarping = true;
          wrapping = "yes";
        };
        fonts = {
          names = ["Monaspace Krypton"];
          style = "Bold";
          size = 17.0;
        };
        gaps = {
          inner = config.sway.borderAndGap;
          outer = config.sway.borderAndGap;
        };
        input = {
          "*" = {
            xkb_layout = "us,ir";
            repeat_delay = "300";
            repeat_rate = "50";
            xkb_numlock = "enabled";
            drag = "enabled";
            tap = "enabled";
            natural_scroll = "enabled";
          };
        };
        keybindings = let
          modifier = "Mod4";
        in
          lib.mkOptionDefault {
            "${modifier}+Return" = "exec ${pkgs.wezterm}/bin/wezterm";
            # "${modifier}+D" = "exec ${pkgs.fuzzel}/bin/fuzzel";

            "${modifier}+q" = "kill";
            "${modifier}+tab" = "layout toggle default tabbed splitv splith";
            "${modifier}+asciitilde" = "move window scratchpad";
            "${modifier}+backslash" = "scratchpad show";
            "${modifier}+Shift+R" = "reload";
            "${modifier}+Mod1+h" = "resize grow width +10";
            "${modifier}+Mod1+l" = "resize grow width -10";
            "${modifier}+Mod2+j" = "resize grow heigth +10";
            "${modifier}+Mod2+k" = "resize grow heigth -10";
            "${modifier}+period" = "focus output right";
            "${modifier}+comma" = "focus output left";
            "${modifier}+greater" = "move window to output left";
            "${modifier}+less" = "move window to output right";
            # "${modifier}+r mode" = "$mode_resize";
            "${modifier}+space" = "splitt";
            "${modifier}+Mod1+space" = "split none";
            "${modifier}+Ctrl+period" = "move workspace to output right";
            "${modifier}+Ctrl+comma" = "move workspace to output left";
            "XF86MonBrightnessUp" = "exec ${pkgs.brightnessctl}/bin/brightnessctl s 10%+";
            "XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl s 10%-";
            "XF86AudioMute" = "exec ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            "XF86AudioLowerVolume" = "exec ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
            "XF86AudioRaiseVolume" = "exec ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
          };
        menu = "fuzzel";
        modifier = "Mod4";
        output = {
          # eDP-1 = {bg = " ~/.config/wallpaper fill";};
          eDP-1 = {
            bg = "${c.base.hex} solid_color";
          };
          # HDMI-A-1 = {bg = " ~/.config/wallpaper fill";};
        };
        startup = [
          {
            command = "xray run -c ~/vless-hackap.json";
          }
          {
            command = "xray run -c ~/vmess-wb.json";
          }
          # {
          # command = "systemctl --user restart waybar";
          # always = true;
          # }
          # {
          #   command = "workstyle";
          #   always = true;
          # }
        ];
        terminal = "${pkgs.wezterm}/bin/wezterm";
        window = {
          border = config.sway.borderAndGap;
          titlebar = false;
        };
        workspaceAutoBackAndForth = true;
        workspaceOutputAssign = [
          {
            output = "eDP-1";
            workspace = "1";
          }
          {
            output = "eDP-1";
            workspace = "2";
          }
          {
            output = "eDP-1";
            workspace = "3";
          }
          {
            output = "eDP-1";
            workspace = "4";
          }
          {
            output = "eDP-1";
            workspace = "5";
          }
          {
            output = "eDP-1";
            workspace = "6";
          }
          {
            output = "DP-1";
            workspace = "7";
          }
          {
            output = "eDP-1";
            workspace = "8";
          }
          {
            output = "eDP-1";
            workspace = "9";
          }
        ];
      };
      swaynag = {
        enable = true;
        settings = {
          "<config>" = {
            edge = "top";
            font = "monospace 10";
          };
        };
      };
      wrapperFeatures = {
        gtk = true;
        base = true;
      };
      xwayland = true;
      extraConfigEarly = ''
        bindgesture swipe:right workspace prev
        bindgesture swipe:left workspace next
        client.focused_tab_title ${c.text.hex} ${c.text.hex} ${c.base.hex} ${c.text.hex} ${c.overlay0.hex}
        titlebar_border_thickness 4
        titlebar_padding ${toString config.sway.borderAndGap}
        bindswitch lid:on  output eDP-1 disable
        bindswitch lid:off output eDP-1 enable
      '';
    };

    # home.file = {
    #   ".config/workstyle/config.toml" = {
    #     source = ./workstyle.toml;
    #   };
    # };

    # home.file = {
    #   ".config/workstyle/config-1.toml" = {
    #     source = configData;
    #   };
    # };
    home.sessionVariables = {
      SDL_VIDEODRIVER = "wayland";
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      _JAVA_AWT_WM_NONREPARENTING = "1";
      XKB_DEFAULT_LAYOUT = "us,ir";
      XKB_DEFAULT_OPTIONS = "grp:alt_shift_toggle,caps:escape";
    };
  };
}
