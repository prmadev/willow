{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.waybar = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = {
    home.packages = with pkgs; [
    ];
    programs.waybar = mkIf config.waybar.enable {
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
            "river/mode"
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
        bordersize-support = "1px";

        bg-base = "background: ${config.colors.base.hex};";
        bg-surface = "background: ${config.colors.surface.hex};";
        bg-overlay = "background: ${config.colors.overlay.hex};";
        bg-muted = "background: ${config.colors.muted.hex};";
        bg-subtle = "background: ${config.colors.subtle.hex};";
        bg-text = "background: ${config.colors.text.hex};";
        bg-love = "background: ${config.colors.love.hex};";
        bg-gold = "background: ${config.colors.gold.hex};";
        bg-rose = "background: ${config.colors.rose.hex};";
        bg-pine = "background: ${config.colors.pine.hex};";
        bg-foam = "background: ${config.colors.foam.hex};";
        bg-iris = "background: ${config.colors.iris.hex};";
        bg-hl-low = "background: ${config.colors.highlight-low.hex};";
        bg-hl-med = "background: ${config.colors.highlight-med.hex};";
        bg-hl-high = "background: ${config.colors.highlight-high.hex};";
        bg-transparent = "background: transparent;";

        border-base = let color = config.colors.base.hex; in "border-top: ${bordersize-main} solid ${color}; border-left:${bordersize-main} solid ${color};border-right:${bordersize-support} solid ${color};border-bottom:${bordersize-support} solid ${color}; ";
        border-surface = let color = config.colors.surface.hex; in "border-top: ${bordersize-main} solid ${color}; border-left:${bordersize-main} solid ${color};border-right:${bordersize-support} solid ${color};border-bottom:${bordersize-support} solid ${color}; ";
        border-overlay = let color = config.colors.overlay.hex; in "border-top: ${bordersize-main} solid ${color}; border-left:${bordersize-main} solid ${color};border-right:${bordersize-support} solid ${color};border-bottom:${bordersize-support} solid ${color}; ";
        border-muted = let color = config.colors.muted.hex; in "border-top: ${bordersize-main} solid ${color}; border-left:${bordersize-main} solid ${color};border-right:${bordersize-support} solid ${color};border-bottom:${bordersize-support} solid ${color}; ";
        border-subtle = let color = config.colors.subtle.hex; in "border-top: ${bordersize-main} solid ${color}; border-left:${bordersize-main} solid ${color};border-right:${bordersize-support} solid ${color};border-bottom:${bordersize-support} solid ${color}; ";
        border-text = let color = config.colors.text.hex; in "border-top: ${bordersize-main} solid ${color}; border-left:${bordersize-main} solid ${color};border-right:${bordersize-support} solid ${color};border-bottom:${bordersize-support} solid ${color}; ";
        border-love = let color = config.colors.love.hex; in "border-top: ${bordersize-main} solid ${color}; border-left:${bordersize-main} solid ${color};border-right:${bordersize-support} solid ${color};border-bottom:${bordersize-support} solid ${color}; ";
        border-gold = let color = config.colors.gold.hex; in "border-top: ${bordersize-main} solid ${color}; border-left:${bordersize-main} solid ${color};border-right:${bordersize-support} solid ${color};border-bottom:${bordersize-support} solid ${color}; ";
        border-rose = let color = config.colors.rose.hex; in "border-top: ${bordersize-main} solid ${color}; border-left:${bordersize-main} solid ${color};border-right:${bordersize-support} solid ${color};border-bottom:${bordersize-support} solid ${color}; ";
        border-pine = let color = config.colors.pine.hex; in "border-top: ${bordersize-main} solid ${color}; border-left:${bordersize-main} solid ${color};border-right:${bordersize-support} solid ${color};border-bottom:${bordersize-support} solid ${color}; ";
        border-foam = let color = config.colors.foam.hex; in "border-top: ${bordersize-main} solid ${color}; border-left:${bordersize-main} solid ${color};border-right:${bordersize-support} solid ${color};border-bottom:${bordersize-support} solid ${color}; ";
        border-iris = let color = config.colors.iris.hex; in "border-top: ${bordersize-main} solid ${color}; border-left:${bordersize-main} solid ${color};border-right:${bordersize-support} solid ${color};border-bottom:${bordersize-support} solid ${color}; ";
        border-hl-low = let color = config.colors.highlight-low.hex; in "border-top: ${bordersize-main} solid ${color}; border-left:${bordersize-main} solid ${color};border-right:${bordersize-support} solid ${color};border-bottom:${bordersize-support} solid ${color}; ";
        border-hl-med = let color = config.colors.highlight-med.hex; in "border-top: ${bordersize-main} solid ${color}; border-left:${bordersize-main} solid ${color};border-right:${bordersize-support} solid ${color};border-bottom:${bordersize-support} solid ${color}; ";
        border-hl-high = let color = config.colors.highlight-high.hex; in "border-top: ${bordersize-main} solid ${color}; border-left:${bordersize-main} solid ${color};border-right:${bordersize-support} solid ${color};border-bottom:${bordersize-support} solid ${color}; ";
        border-transparent = let color = "transparent"; in "border-top: ${bordersize-main} solid ${color}; border-left:${bordersize-main} solid ${color};border-right:${bordersize-support} solid ${color};border-bottom:${bordersize-support} solid ${color}; ";

        fg-base = "color: ${config.colors.base.hex};";
        fg-surface = "color: ${config.colors.surface.hex};";
        fg-overlay = "color: ${config.colors.overlay.hex};";
        fg-muted = "color: ${config.colors.muted.hex};";
        fg-subtle = "color: ${config.colors.subtle.hex};";
        fg-text = "color: ${config.colors.text.hex};";
        fg-love = "color: ${config.colors.love.hex};";
        fg-gold = "color: ${config.colors.gold.hex};";
        fg-rose = "color: ${config.colors.rose.hex};";
        fg-pine = "color: ${config.colors.pine.hex};";
        fg-foam = "color: ${config.colors.foam.hex};";
        fg-iris = "color: ${config.colors.iris.hex};";
        fg-hl-low = "color: ${config.colors.highlight-low.hex};";
        fg-hl-med = "color: ${config.colors.highlight-med.hex};";
        fg-hl-high = "color: ${config.colors.highlight-high.hex};";
        fg-transparent = "color: transparent;";

        radi0 = "border-radius: 0;";
        radi5 = "border-radius: 5;";

        bold = "font-weight: 900;";
      in let
        prelude = ''
                 *{
                 		border:none;
                         font-family: ${config.global-fonts.main-family};
                         font-size: 15px;
                         min-height: 20px;
          ${radi0}
                 	}
        '';
        language = ''
          #language {
            ${bg-base}
            ${radi0}
            ${fg-pine}
            padding: 5px;
            margin: 10px 10px 0px 10px;
          }
        '';
        workspace-button = ''#workspaces button{ ${border-iris} ${fg-iris} ${bg-base} ${bold} padding: 5px; margin:5px 5px 0px 5px;}'';
        workspace-button-active = ''#workspaces button.active {${border-gold} ${fg-gold}}'';
        workspace-button-focused = ''#workspaces button.focused {${border-gold} ${fg-gold}}'';
        workspace-button-occupied = ''#workspaces button.occupied {${border-foam}}'';
        workspace-button-visible = ''#workspaces button.visible {${border-foam}}'';
        window-waybar = ''window#waybar{ ${bg-transparent} ${radi0}}'';
        tooltip = ''tooltip { ${bg-surface} }'';
        tooltip-label = ''tooltip label{ ${fg-text} }'';
        tags = ''#tags{ ${bg-transparent} ${radi0} padding:5px 5px 0px 5px;}'';
        tags-button = ''#tags button{ ${bg-base}  ${fg-transparent} padding: 0px 5px; margin-right:5px; margin-left:5px;}'';
        tags-button-occupied = "#tags button.occupied {${radi0} ${bg-base} ${bold} ${fg-iris}}";
        tags-button-focused = "#tags button.focused {${radi0} ${bg-base} ${bold} ${fg-love}}";
        tags-button-urgent = "#tags button.urgent {${radi0} ${bg-base} ${bold} ${fg-gold}}";
        other-widgets = "#custom-date, #clock, #battery, #pulseaudio,#network,#custom-joljol {${fg-text} ${bg-base} ${bold} padding: 2.5px 15px; margin: 5px 5px 0px 0px;}";
        clock = "#clock { ${fg-gold} ${border-gold}}";
        network = "#network { ${fg-foam} ${border-foam}}";
        bat = "#battery { ${fg-pine} ${border-pine}}";
        batcharging = "#battery.charging{ ${fg-foam} ${border-foam}}";
        bathundnotcharging = "#battery.hundred:not(.charging){ ${fg-pine} ${border-pine}}";
        batnotcharging = "#battery:not(.charging){ ${fg-rose} ${border-rose}}";
        bat30notcharging = "#battery.thirty:not(.charging){ ${fg-love} ${border-love}}";
        pulse = "#pulseaudio {${radi0} ${border-iris} ${fg-iris}}";
        pulsemuted = "#pulseaudio.muted {${radi0} ${border-love} ${fg-love}}";
        tray = "#tray {${radi0} ${border-foam} margin: 10px 10px 0px 10px;}";
        traymenu = "#traymenu {${radi0} }";
      in
        prelude
        + language
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
