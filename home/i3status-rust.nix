{
  lib,
  config,
  ...
}:
with lib; {
  options.i3status-rust.enable = mkEnableOption "i3status-rust settings";
  config = mkIf config.i3status-rust.enable {
    programs.i3status-rust = {
      enable = true;
      bars = {
        default = {
          blocks = [
            {
              block = "maildir";
              inboxes = ["~/mail/prma/*"];
            }
            {
              block = "sound";
            }
            {
              block = "battery";
              format = " $icon $percentage ";
              full_format = " $icon $percentage ";
              full_threshold = 100;
            }
            {
              block = "keyboard_layout";
              driver = "sway";
            }
            {
              block = "net";
              format = "^icon_net_down$speed_down.eng(prefix:K) ^icon_net_up$speed_up.eng(prefix:K) ($ssid)";
            }
            {
              block = "time";
              format = " $timestamp.datetime(f:'%a %Y-%m-%d %R') ";
              interval = 1;
            }
          ];
          settings = {
            theme = {
              # theme = "ctp-macchiato";
              # overrides = {
              #   separator = "   ";
              #   idle_bg = config.colors.macchiato.base.hex;
              #   idle_fg = config.colors.macchiato.text.hex;
              #   good_bg = config.colors.macchiato.base.hex;
              #   good_fg = config.colors.macchiato.green.hex;
              #   warning_bg = config.colors.macchiato.yellow.hex;
              #   warning_fg = config.colors.macchiato.base.hex;
              #   critical_bg = config.colors.macchiato.maroon.hex;
              #   critical_fg = config.colors.macchiato.base.hex;
              #   info_bg = config.colors.macchiato.base.hex;
              #   info_fg = config.colors.macchiato.blue.hex;
              # };
              theme = "ctp-macchiato";
              overrides = {
                separator = "   ";
                idle_bg = config.colors.moon.base.hex;
                idle_fg = config.colors.moon.text.hex;
                good_bg = config.colors.moon.base.hex;
                good_fg = config.colors.moon.pine.hex;
                warning_bg = config.colors.moon.gold.hex;
                warning_fg = config.colors.moon.base.hex;
                critical_bg = config.colors.moon.love.hex;
                critical_fg = config.colors.moon.base.hex;
                info_bg = config.colors.moon.base.hex;
                info_fg = config.colors.moon.foam.hex;
              };
            };
          };
          theme = "ctp-macchiato";
          icons = "material-nf";
        };
      };
    };
  };
}
