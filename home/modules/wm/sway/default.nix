{
  pkgs,
  lib,
  config,
  ...
}:
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
      config = {
        bars = [];

        colors = {
          background = config.colors.base.hex;
          focused = {
            background = config.colors.love.hex;
            border = config.colors.love.hex;
            childBorder = config.colors.love.hex;
            indicator = config.colors.gold.hex;
            text = config.colors.base.hex;
          };
          focusedInactive = {
            background = config.colors.rose.hex;
            border = config.colors.rose.hex;
            childBorder = config.colors.rose.hex;
            indicator = config.colors.gold.hex;
            text = config.colors.base.hex;
          };

          placeholder = {
            background = config.colors.surface.hex;
            border = config.colors.surface.hex;
            childBorder = config.colors.overlay.hex;
            indicator = config.colors.overlay.hex;
            text = config.colors.text.hex;
          };

          unfocused = {
            background = config.colors.base.hex;
            border = config.colors.base.hex;
            childBorder = config.colors.base.hex;
            indicator = config.colors.base.hex;
            text = config.colors.text.hex;
          };
          urgent = {
            background = config.colors.gold.hex;
            border = config.colors.gold.hex;
            childBorder = config.colors.pine.hex;
            indicator = config.colors.pine.hex;
            text = config.colors.base.hex;
          };
        };
        floating.border = 5;
        focus = {
          #followMouse = "always";
          mouseWarping = true;
        };
        fonts = {
          names = ["monospace"];
          style = "Bold";
          size = 15.0;
        };
        gaps = {
          inner = 10;
          outer = 0;
        };
        input = {
          "*" = {
            xkb_layout = "us,ir";
            repeat_delay = "300";
            repeat_rate = "50";
            xkb_numlock = "enabled";
            drag = "enabled";
            tap = "enabled";
          };
        };
        keybindings = let
          modifier = "Mod4";
        in
          lib.mkOptionDefault {
            "${modifier}+Return" = "exec ${pkgs.kitty}/bin/kitty";
            # "${modifier}+D" = "exec ${pkgs.rofi}/bin/rofi -show";

            "${modifier}+q" = "kill";
            "${modifier}+tab" = "layout toggle default tabbed splitv splith";
            "${modifier}+asciitilde" = "move window scratchpad";
            "${modifier}+grave" = "show scratchpad";
            "${modifier}+r" = "reload";
            "${modifier}+Mod1+h" = "resize grow width -10";
            "${modifier}+Mod1+l" = "resize grow width +10";
            "${modifier}+Mod2+j" = "resize grow heigth +10";
            "${modifier}+Mod2+k" = "resize grow heigth -10";
            "${modifier}+space" = "splitt";
          };
        menu = "rofi -show";
        modifier = "Mod4";
        output = {
          eDP-1 = {bg = " ~/.config/wallpaper fill";};
          DP-1 = {bg = " ~/.config/wallpaper fill";};
          HDMI-A-1 = {bg = " ~/.config/wallpaper fill";};
        };
        startup = [
          {
            command = "systemctl --user restart waybar";
            always = true;
          }
          {
            command = "clash";
          }
          {command = "sslocal -c ~/.config/shadowsocks/config.json --server-url \"ss://YWVzLTI1Ni1nY206WTZSOXBBdHZ4eHptR0M@38.114.114.69:338#US_1009\"";}
        ];
        terminal = "${pkgs.kitty}/bin/kitty";
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
