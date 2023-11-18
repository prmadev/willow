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
  };
  config = mkIf config.sway.enable {
    home.packages = with pkgs; [
      swayr
      # swaywsr
      sway-contrib.grimshot
      workstyle
    ];

    waybar.enable = true;
    wayland.enable = true;
    wayland.windowManager.sway = {
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
      config = let
        c = config.colors.macchiato;
      in {
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
            trayPadding = 5;
            workspaceButtons = true;
            workspaceNumbers = true;
            statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs config-default";
          }
        ];

        colors = {
          background = c.base.hex;
          focused = {
            background = c.base.hex;
            border = c.text.hex;
            childBorder = c.text.hex;
            indicator = c.text.hex;
            text = c.text.hex;
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
            border = c.base.hex;
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
        floating.border = 5;
        focus = {
          followMouse = "always";
          mouseWarping = true;
        };
        fonts = {
          names = ["Monaspace Krypton"];
          style = "Bold";
          size = 10.0;
        };
        gaps = {
          inner = 5;
          outer = 5;
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
            "${modifier}+Return" = "exec ${pkgs.foot}/bin/foot";
            # "${modifier}+D" = "exec ${pkgs.fuzzel}/bin/fuzzel";

            "${modifier}+q" = "kill";
            "${modifier}+tab" = "layout toggle default tabbed splitv splith";
            "${modifier}+asciitilde" = "move window scratchpad";
            "${modifier}+backslash" = "show scratchpad";
            "${modifier}+Shift+R" = "reload";
            "${modifier}+Mod1+h" = "resize grow width -10";
            "${modifier}+Mod1+l" = "resize grow width +10";
            "${modifier}+Mod2+j" = "resize grow heigth +10";
            "${modifier}+Mod2+k" = "resize grow heigth -10";
            "${modifier}+period" = "focus output right";
            "${modifier}+comma" = "focus output left";
            "${modifier}+greater" = "move window to output left";
            "${modifier}+less" = "move window to output right";
            # "${modifier}+r mode" = "$mode_resize";
            "${modifier}+space" = "splitt";
            "${modifier}+Ctrl+period" = "move workspace to output right";
            "${modifier}+Ctrl+comma" = "move workspace to output left";
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
          # {
          # command = "systemctl --user restart waybar";
          # always = true;
          # }
          # {
          #   command = "workstyle";
          #   always = true;
          # }
          # {
          #   command = "clash";
          # }
          # {command = "sslocal -c ~/.config/shadowsocks/config.json --server-url \"ss://YWVzLTI1Ni1nY206WTZSOXBBdHZ4eHptR0M@38.114.114.69:338#US_1009\"";}
        ];
        terminal = "${pkgs.wezterm}/bin/wezterm";
        window = {
          border = 5;
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
