{
  lib,
  config,
  ...
}:
with lib; {
  options.waybar.enable = mkEnableOption "waybar settings";

  config = mkIf config.waybar.enable {
    programs.waybar = {
      enable = true;
      systemd.enable = false;
      # systemd.target =graphical-session.target;
      # systemd.target = mkIf config.sway.enable "sway-session.target";
      settings = {
        mainBar = {
          gtk-layer-shell = true;
          position = "top";
          height = 0;
          modules-left = [
            "sway/mode"
            "sway/workspaces"
            "wlr/workspaces"
            # "river/mode"
            "river/tags"
          ];
          modules-center = [
            # "group/hx"
            "wlr/taskbar"
          ];

          modules-right = [
            "tray"
            "network"
            "pulseaudio"
            "battery"
            "sway/language"
            "clock"
          ];

          # "group/hx" = {
          #   "orientation" = "horizontal";
          #   "modules" = [
          #     "custom/hxsubject"
          #     "custom/hxkey"
          #     "custom/hxdesc"
          #     "custom/hxcommand"
          #   ];
          # };
          # "custom/hxsubject" = {
          #   "exec" = "cat ${config.repos.hxkeyboards.path}/$(date +%j).json | jq '.subject' --unbuffered --compact-output --raw-output";
          #   "restart-interval" = 300;
          # };
          # "custom/hxkey" = {
          #   "exec" = "cat ${config.repos.hxkeyboards.path}/$(date +%j).json | jq '.key' --unbuffered --compact-output --raw-output";
          #   "restart-interval" = 300;
          # };
          # "custom/hxdesc" = {
          #   "exec" = "cat ${config.repos.hxkeyboards.path}/$(date +%j).json | jq '.description' --unbuffered --compact-output --raw-output";
          #   "restart-interval" = 300;
          # };
          # "custom/hxcommand" = {
          #   "exec" = "cat ${config.repos.hxkeyboards.path}/$(date +%j).json | jq '.command' --unbuffered --compact-output --raw-output";
          #   "restart-interval" = 300;
          # };

          "wlr/taskbar" = {
            all-outputs = false;
            format = "{app_id}";
          };
          "sway/workspaces" = {
            all-outputs = false;
            format = "{value}";
          };
          "river/tags" = {
            num-tags = 9;
          };
          "river/mode" = {
            format = "Mode: {}";
          };
          "clock" = {
            format = "{:%H:%M}";
            format-alt = "{:%Y-%m-%d}";
          };

          "sway/language" = {
            format = "{}";
            on-click = "swaymsg input type:keyboard xkb_switch_layout next";
          };
          "battery" = {
            interval = 60;
            states = {
              hundred = 100;
              ninty = 90;
              eighty = 80;
              seventy = 70;
              sixty = 60;
              fifty = 50;
              fourty = 40;
              thirty = 30;
              twenty = 20;
              ten = 10;
              five = 5;
              three = 3;
            };
            format = "{ capacity }";
            format-charging = "{capacity}";
            format-discharging = "{capacity}";
            format-plugged = "{capacity}";
            format-full = "{capacity}";
          };

          network = {
            "format-wifi" = "  {essid}";
            "format-ethernet" = "ﯱ {ifname}";
            "format-linked" = "  (No IP)";
            "format-disconnected" = "睊";
            "format-alt" = "{bandwidthUpBytes} {bandwidthDownBits}";
            "interval" = 2;
          };

          "pulseaudio" = {
            "format" = "{icon}";
            "format-muted" = "";
            "on-click" = "pactl set-sink-mute  alsa_output.pci-0000_00_1f.3.analog-stereo toggle";
            "scroll-steps" = 10;
            "format-icons" = {
              "headphone" = " ";
              "hands-free" = "";
              "headset" = "";
              "phone" = "";
              "portable" = "";
              "car" = "";
              "default" = [
                ""
                ""
                ""
              ];
            };
          };

          "tray" = {
            "show-passive-items" = true;
            "icon-size" = 20;
            "spacing" = 10;
          };
        };
      };

      #TODO use variable colors
      style = let
        bordersize-main = "3px";
        bordersize-support = "3px";
        radi0 = "border-radius: 3px;";
        bold = "font-weight: bold;";

        mkBorder = color: "border-top: ${bordersize-main} solid ${color}; border-left:${bordersize-main} solid ${color};border-right:${bordersize-support} solid ${color};border-bottom:${bordersize-support} solid ${color}; ";
        mkBg = color: "background: ${color};";
        mkFg = color: "color: ${color};";
        mkPR = color: {
          fg = mkFg color;
          bg = mkBg color;
          border = mkBorder color;
        };

        prop = {
          base = mkPR config.colors.moon.base.hex;
          surface0 = mkPR config.colors.macchiato.surface0.hex;
          text = mkPR config.colors.macchiato.text.hex;
          rosewater = mkPR config.colors.macchiato.rosewater.hex;
          flamingo = mkPR config.colors.macchiato.flamingo.hex;
          pink = mkPR config.colors.macchiato.pink.hex;
          mauve = mkPR config.colors.macchiato.mauve.hex;
          red = mkPR config.colors.macchiato.red.hex;
          maroon = mkPR config.colors.macchiato.maroon.hex;
          peach = mkPR config.colors.macchiato.peach.hex;
          yellow = mkPR config.colors.macchiato.yellow.hex;
          green = mkPR config.colors.macchiato.green.hex;
          teal = mkPR config.colors.macchiato.teal.hex;
          sky = mkPR config.colors.macchiato.sky.hex;
          sapphire = mkPR config.colors.macchiato.sapphire.hex;
          blue = mkPR config.colors.macchiato.blue.hex;
          lavendar = mkPR config.colors.macchiato.lavendar.hex;
          subtext1 = mkPR config.colors.macchiato.subtext1.hex;
          subtext0 = mkPR config.colors.macchiato.subtext0.hex;
          overlay2 = mkPR config.colors.macchiato.overlay2.hex;
          overlay1 = mkPR config.colors.macchiato.overlay1.hex;
          overlay0 = mkPR config.colors.macchiato.overlay0.hex;
          surface2 = mkPR config.colors.macchiato.surface2.hex;
          surface1 = mkPR config.colors.macchiato.surface1.hex;
          mantle = mkPR config.colors.macchiato.mantle.hex;
          crust = mkPR config.colors.macchiato.crust.hex;
          transparent = mkPR "transparent";
        };
      in let
        prelude = ''
          * {
           		border:none;
               font-family: ${config.global-fonts.main-family};
               font-size: 15px;
               min-height: 20px;
               border-radius: 1px;
           	}
        '';
        window-waybar = ''window#waybar{ ${prop.transparent.bg} ${radi0}}'';
        tooltip = ''tooltip { ${prop.surface0.bg} }'';
        tooltip-label = ''tooltip label{ ${prop.text.fg} }'';
        tags = ''#tags{ ${prop.transparent.bg} ${radi0} padding:5px 5px 0px 5px; }'';
        tags-button = ''#tags button{ ${prop.base.bg} ${prop.base.border} ${prop.transparent.fg} padding: 0px 5px; margin-right:5px; margin-left:5px; }'';
        tags-button-occupied = "#tags button.occupied {${radi0} ${prop.base.border} ${prop.base.bg}  ${prop.text.fg}}";
        tags-button-focused = "#tags button.focused {${radi0} ${prop.text.bg} ${bold}${prop.base.border} ${prop.base.fg}}";
        tags-button-urgent = "#tags button.urgent {${radi0} ${prop.base.bg} ${bold} ${prop.text.border} ${prop.text.fg}}";
        other-widgets = "#custom-date, #clock, #battery, #pulseaudio,#network,#custom-joljol {${prop.text.fg} ${prop.base.bg} ${prop.transparent.border} ${bold} padding: 2.5px 15px; margin: 5px 5px 0px 0px;}";
        clock = "#clock { ${prop.text.fg} }";
        network = "#network {  }";
        bat = "#battery { }";
        batcharging = "#battery.charging{ }";
        bathundnotcharging = "#battery.hundred:not(.charging){ ${prop.text.border}}";
        batnotcharging = "#battery:not(.charging){ ${prop.text.border}}";
        bat30notcharging = "#battery.thirty:not(.charging){ ${prop.base.fg} ${prop.text.bg} }";
        pulse = "#pulseaudio { ${radi0} }";
        pulsemuted = "#pulseaudio.muted {${radi0} ${prop.text.border}  ${prop.base.bg} }";
        tray = "#tray { ${radi0}  margin: 10px 10px 0px 10px; padding: 2.5px 15px; margin: 5px 5px 0px 0px; }";
        traymenu = "#traymenu { ${radi0} }";
        # customhxsubject = "#custom-hxsubject { ${prop.text.fg} ${prop.base.bg} margin: 10px 10px 0px 10px; padding: 2.5px 15px; margin: 5px 5px 0px 0px; }";
        # customhxkey = "#custom-hxkey { ${prop.text.bg} ${prop.base.fg} margin: 10px 10px 0px 10px; padding: 2.5px 15px; margin: 5px 5px 0px 0px; }";
        # customhxdesc = "#custom-hxdesc { ${prop.text.fg} ${prop.base.bg} margin: 10px 10px 0px 10px; padding: 2.5px 15px; margin: 5px 5px 0px 0px; }";
        # customhxcommand = "#custom-hxcommand { ${prop.subtext0.fg} ${prop.base.bg} margin: 10px 10px 0px 10px; padding: 2.5px 15px; margin: 5px 5px 0px 0px; }";
      in
        prelude
        + window-waybar
        + tooltip
        + tooltip-label
        + tags
        + tags-button
        + tags-button-occupied
        + tags-button-focused
        + tags-button-urgent
        + other-widgets
        + clock
        + network
        # + customhxsubject
        # + customhxkey
        # + customhxdesc
        # + customhxcommand
        + bat
        + batcharging
        + bathundnotcharging
        + batnotcharging
        + bat30notcharging
        + pulse
        + pulsemuted
        + tray
        + traymenu;
    };
  };
}
