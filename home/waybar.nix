{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.waybar.enable = mkEnableOption "waybar settings";

  config = mkIf config.waybar.enable {
    programs.waybar = {
      enable = true;
      # systemd.enable = true;
      # systemd.target = mkIf config.sway.enable "sway-session.target";
      settings = {
        mainBar = {
          gtk-layer-shell = true;
          position = "top";
          height = 0;
          modules-left = [
            # "sway/mode"
            # "sway/workspaces"
            # "wlr/workspaces"
            # "wlr/taskbar"
            # "river/mode"
            "river/tags"
          ];
          modules-center = [
          ];

          modules-right = [
            "tray"
            "network"
            "pulseaudio"
            "battery"
            # "sway/language"
            "clock"
          ];

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
            "format-wifi" = " ";
            "format-ethernet" = "ﯱ";
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
        bordersize-main = "5px";
        bordersize-support = "2px";

        bg-base = "background: ${config.colors.macchiato.base.hex};";
        bg-surface = "background: ${config.colors.macchiato.surface0.hex};";
        bg-transparent = "background: transparent;";

        border-peach = let color = config.colors.macchiato.peach.hex; in "border-top: ${bordersize-main} solid ${color}; border-left:${bordersize-main} solid ${color};border-right:${bordersize-support} solid ${color};border-bottom:${bordersize-support} solid ${color}; ";
        border-text = let color = config.colors.macchiato.text.hex; in "border-top: ${bordersize-main} solid ${color}; border-left:${bordersize-main} solid ${color};border-right:${bordersize-support} solid ${color};border-bottom:${bordersize-support} solid ${color}; ";
        border-flamingo = let color = config.colors.macchiato.flamingo.hex; in "border-top: ${bordersize-main} solid ${color}; border-left:${bordersize-main} solid ${color};border-right:${bordersize-support} solid ${color};border-bottom:${bordersize-support} solid ${color}; ";
        border-sapphire = let color = config.colors.macchiato.sapphire.hex; in "border-top: ${bordersize-main} solid ${color}; border-left:${bordersize-main} solid ${color};border-right:${bordersize-support} solid ${color};border-bottom:${bordersize-support} solid ${color}; ";
        border-sky = let color = config.colors.macchiato.sky.hex; in "border-top: ${bordersize-main} solid ${color}; border-left:${bordersize-main} solid ${color};border-right:${bordersize-support} solid ${color};border-bottom:${bordersize-support} solid ${color}; ";
        border-maroon = let color = config.colors.macchiato.maroon.hex; in "border-top: ${bordersize-main} solid ${color}; border-left:${bordersize-main} solid ${color};border-right:${bordersize-support} solid ${color};border-bottom:${bordersize-support} solid ${color}; ";
        border-lavendar = let color = config.colors.macchiato.lavendar.hex; in "border-top: ${bordersize-main} solid ${color}; border-left:${bordersize-main} solid ${color};border-right:${bordersize-support} solid ${color};border-bottom:${bordersize-support} solid ${color}; ";
        border-red = let color = config.colors.macchiato.red.hex; in "border-top: ${bordersize-main} solid ${color}; border-left:${bordersize-main} solid ${color};border-right:${bordersize-support} solid ${color};border-bottom:${bordersize-support} solid ${color}; ";

        fg-text = "color: ${config.colors.macchiato.text.hex};";
        fg-red = "color: ${config.colors.macchiato.red.hex};";
        fg-flamingo = "color: ${config.colors.macchiato.flamingo.hex};";
        fg-maroon = "color: ${config.colors.macchiato.maroon.hex};";
        fg-sapphire = "color: ${config.colors.macchiato.sapphire.hex};";
        fg-sky = "color: ${config.colors.macchiato.sky.hex};";
        fg-lavendar = "color: ${config.colors.macchiato.lavendar.hex};";
        fg-peach = "color: ${config.colors.macchiato.peach.hex};";
        fg-transparent = "color: transparent;";

        radi0 = "border-radius: 0;";

        bold = "font-weight: bold;";
      in let
        prelude = ''
                          *{
                          		border:none;
                                 font-family: ${config.global-fonts.main-family};
                                 font-size: 15px;
                                 min-height: 20px;
          border-radius: 0;
                          	}
        '';
        workspace-button = ''#workspaces button{ ${border-lavendar} ${fg-lavendar} ${bg-base} ${bold} padding: 5px; margin:5px 5px 0px 5px;}'';
        workspace-button-active = ''#workspaces button.active {${border-flamingo} ${fg-flamingo}}'';
        workspace-button-focused = ''#workspaces button.focused {${border-flamingo} ${fg-flamingo}}'';
        workspace-button-occupied = ''#workspaces button.occupied {${border-sky}}'';
        workspace-button-visible = ''#workspaces button.visible {${border-sky}}'';
        window-waybar = ''window#waybar{ ${bg-transparent} ${radi0}}'';
        tooltip = ''tooltip { ${bg-surface} }'';
        tooltip-label = ''tooltip label{ ${fg-text} }'';
        tags = ''#tags{ ${bg-transparent}  ${radi0} padding:5px 5px 0px 5px;}'';
        tags-button = ''#tags button{ ${bg-base} ${border-text} ${fg-text} ${fg-transparent} padding: 0px 5px; margin-right:5px; margin-left:5px;}'';
        tags-button-occupied = "#tags button.occupied {${radi0} ${border-sky} ${bg-base}  ${fg-sky}}";
        tags-button-focused = "#tags button.focused {${radi0} ${bg-base} ${bold}${border-peach} ${fg-peach}}";
        tags-button-urgent = "#tags button.urgent {${radi0} ${bg-base} ${bold} ${border-red} ${fg-red}}";
        other-widgets = "#custom-date, #clock, #battery, #pulseaudio,#network,#custom-joljol {${fg-text} ${bg-base} ${bold} padding: 2.5px 15px; margin: 5px 5px 0px 0px;}";
        clock = "#clock { ${fg-flamingo} ${border-flamingo}}";
        network = "#network { ${fg-sky} ${border-sky}}";
        bat = "#battery { ${fg-sapphire} ${border-sapphire}}";
        batcharging = "#battery.charging{ ${fg-sky} ${border-sky}}";
        bathundnotcharging = "#battery.hundred:not(.charging){ ${fg-sapphire} ${border-sapphire}}";
        batnotcharging = "#battery:not(.charging){ ${fg-maroon} ${border-maroon}}";
        bat30notcharging = "#battery.thirty:not(.charging){ ${fg-peach} ${border-peach}}";
        pulse = "#pulseaudio {${radi0} ${border-lavendar} ${fg-lavendar}}";
        pulsemuted = "#pulseaudio.muted {${radi0} ${border-peach} ${fg-red}}";
        tray = "#tray {${radi0} ${border-sky} margin: 10px 10px 0px 10px;}";
        traymenu = "#traymenu {${radi0} }";
      in
        prelude
        + workspace-button
        + workspace-button-focused
        + workspace-button-active
        + workspace-button-occupied
        + workspace-button-visible
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
