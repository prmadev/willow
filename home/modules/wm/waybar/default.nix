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
      systemd.enable = true;
      settings = {
        mainBar = {
          gtk-layer-shell = true;
          position = "top";
          height = 0;
          modules-left = [
            "sway/mode"
            "sway/workspaces"
            # "wlr/workspaces"
            # "wlr/taskbar"
            # "river/mode"
            "river/tags"
          ];
          modules-center = [
            "clock"
          ];

          modules-right = [
            "tray"
            "network"
            "pulseaudio"
            "battery"
            "sway/language"
          ];

          "sway/workspaces" = {
            all-outputs = false;
            format = "{index} {value}";
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
            "format-wifi" = "";
            "format-ethernet" = "ﯱ";
            "format-linked" = "  (No IP)";
            "format-disconnected" = "睊";
            "format-alt" = "{bandwidthUpBytes} {bandwidthDownBits}";
            "interval" = 2;
          };

          "pulseaudio" = {
            "states" = {
              "hundred" = 100;
              "ninty" = 90;
              "eighty" = 80;
              "seventy" = 70;
              "sixty" = 60;
              "fifty" = 50;
              "fourty" = 40;
              "thirty" = 30;
              "twenty" = 20;
              "ten" = 10;
              "zero" = 0;
            };
            "format" = "{icon}";
            "format-muted" = "";
            "on-click" = "pactl set-sink-mute  alsa_output.pci-0000_00_1f.3.analog-stereo toggle";
            "scroll-steps" = 10;
            "format-icons" = {
              "headphone" = "";
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
          "custom/joljol" = {
            "exec" = "joljol";
            "format" = "{}";
            "update-interval" = 100;
          };
        };
      };

      #TODO use variable colors
      style = ''
        * {
        	border: none;
        	font-family: ${config.global-fonts.main-family};
        	font-size: 15px;
        	min-height: 20px;
        	border-radius: 5px;
        }
        #workspaces button {
          border-radius: 5px;
          background: ${config.colors.base.hex};
          padding: 5px;
        }

        #workspaces button.visible {

        }

        #workspaces button.focused {
        font-weigth: 900;

        }

        #workspaces button.urgent {

        }

        #workspaces button.current_output {


        }

        window#waybar {
        	background: transparent;
        	border-radius: 5px;
        }
        tooltip {
        	background: ${config.colors.surface.hex};
        }

        tooltip label {
        	color: ${config.colors.text.hex};
        }
        #tags {
        	background-color: transparent;
        	border-radius: 0px;
        	padding: 5px 5px 0px 5px;
        }

        #tags button {
        	padding: 0px 5px;
        	margin-right: 5px;
        	margin-left: 5px;
        	color: transparent;
        	/* border: 0px solid transparent; */
        	/* border-top: 3px solid #f6c177; */
        	/* border-left: 3px solid #f6c177; */
        	/* border-bottom: 2px solid #f6c177; */
        	background: ${config.colors.surface.hex};
        }

        #tags button.occupied {
        	border-radius: 0px;
        	font-weight: bold;
        	color: ${config.colors.base.hex};
        	background: ${config.colors.foam.hex};
        }

        #tags button.focused {
        	font-weight: 900;
        	color: ${config.colors.base.hex};
        	background: ${config.colors.rose.hex};
        }

        #tags button.urgent {
        	color: ${config.colors.base.hex};
        	background-color: ${config.colors.love.hex};
        	border-radius: 0px;
        }

        #custom-date,
        #clock,
        #battery,
        #pulseaudio,
        #network,
        #custom-joljol {
        	background:${config.colors.pine.hex};
        	color:${config.colors.base.hex} ;
        	padding: 2.5px 15px;
        	margin: 10px 10px 0px 0px;
        	font-weight: 900;
        }

        #clock {
        	background: ${config.colors.pine.hex};
        }
        #custom-hyprmon.firstmon{
          background: ${config.colors.love.hex};
          margin: 10px 10px 0px 10px;
        }

        #custom-joljol {
        	background: ${config.colors.pine.hex};
        	margin: 10px 10px 0px 10px;
        }

        #battery {
        	color: ${config.colors.base.hex};
        	background: ${config.colors.foam.hex};
        }

        /* #battery.charging { */
        /* 	color: #9ccfd8; */
        /* } */

        #battery.ninty.charging {
        	background: linear-gradient(to right, ${config.colors.pine.hex} 90%, ${config.colors.foam.hex} 90%);
        }
        #battery.ninty:not(.charging) {
        	background: linear-gradient(to right, ${config.colors.pine.hex} 90%, ${config.colors.rose.hex} 90%);
        }
        #battery.eighty.charging {
        	background: linear-gradient(to right, ${config.colors.pine.hex} 80%, ${config.colors.foam.hex} 80%);
        }
        #battery.eighty:not(.charging) {
        	background: linear-gradient(to right, ${config.colors.pine.hex} 80%, ${config.colors.rose.hex} 80%);
        }
        #battery.seventy.charging {
        	background: linear-gradient(to right, ${config.colors.pine.hex} 70%, ${config.colors.foam.hex} 70%);
        }
        #battery.seventy:not(.charging) {
        	background: linear-gradient(to right, ${config.colors.pine.hex} 70%, ${config.colors.rose.hex} 70%);
        }
        #battery.sixty.charging {
        	background: linear-gradient(to right, ${config.colors.pine.hex} 60%, ${config.colors.foam.hex} 60%);
        }
        #battery.sixty:not(.charging) {
        	background: linear-gradient(to right, ${config.colors.pine.hex} 60%, ${config.colors.rose.hex} 60%);
        }
        #battery.fifty.charging {
        	background: linear-gradient(to right, ${config.colors.pine.hex} 50%, ${config.colors.foam.hex} 50%);
        }
        #battery.fifty:not(.charging) {
        	background: linear-gradient(to right, ${config.colors.pine.hex} 50%, ${config.colors.rose.hex} 50%);
        }
        #battery.fourty.charging {
        	background: linear-gradient(to right, ${config.colors.pine.hex} 40%, ${config.colors.foam.hex} 40%);
        }
        #battery.fourty:not(.charging) {
        	background: linear-gradient(to right, ${config.colors.pine.hex} 40%, ${config.colors.rose.hex} 40%);
        }
        #battery.thirty.charging {
        	background: linear-gradient(to right, ${config.colors.pine.hex} 30%, ${config.colors.foam.hex} 30%);
        }
        #battery.thirty:not(.charging) {
        	background: linear-gradient(to right, ${config.colors.pine.hex} 30%, ${config.colors.rose.hex} 30%);
        }
        #battery.twenty.charging {
        	background: linear-gradient(to right, ${config.colors.pine.hex} 20%, ${config.colors.foam.hex} 20%);
        }
        #battery.twenty:not(.charging) {
        	background: linear-gradient(to right, ${config.colors.pine.hex} 20%, ${config.colors.love.hex} 20%);
        }
        #battery.ten.charging {
        	background: linear-gradient(to right, ${config.colors.pine.hex} 10%, ${config.colors.foam.hex} 10%);
        }
        #battery.ten:not(.charging) {
        	background: linear-gradient(to right, ${config.colors.pine.hex} 10%, ${config.colors.love.hex} 10%);
        }
        #battery.five.charging {
        	background: linear-gradient(to right, ${config.colors.pine.hex} 5%, ${config.colors.foam.hex} 5%);
        }
        #battery.five:not(.charging) {
        	background: linear-gradient(to right, ${config.colors.pine.hex} 5%, ${config.colors.love.hex} 5%);
        }
        #battery.three.charging {
        	background: linear-gradient(to right, ${config.colors.pine.hex} 3%, ${config.colors.foam.hex} 3%);
        }
        #battery.three:not(.charging) {
        	background: linear-gradient(to right, ${config.colors.pine.hex} 3%, ${config.colors.love.hex} 3%);
        }
        #network {
        	background: ${config.colors.pine.hex};
        }

        #pulseaudio {
        	background: ${config.colors.iris.hex};
        	color: ${config.colors.base.hex};
                    border-radius: 5px;

        }
        #pulseaudio.ninty {
        	background: linear-gradient(to top, ${config.colors.iris.hex} 90%, ${config.colors.rose.hex} 90%);
        }
        #pulseaudio.eighty {
        	background: linear-gradient(to top, ${config.colors.iris.hex} 80%, ${config.colors.rose.hex} 80%);
        }
        #pulseaudio.seventy {
        	background: linear-gradient(to top, ${config.colors.iris.hex} 70%, ${config.colors.rose.hex} 70%);
        }
        #pulseaudio.sixty {
        	background: linear-gradient(to top, ${config.colors.iris.hex} 60%, ${config.colors.rose.hex} 60%);
        }
        #pulseaudio.fifty {
        	background: linear-gradient(to top, ${config.colors.iris.hex} 50%, ${config.colors.rose.hex} 50%);
        }
        #pulseaudio.fourty {
        	background: linear-gradient(to top, ${config.colors.iris.hex} 40%, ${config.colors.rose.hex} 40%);
        }
        #pulseaudio.thirty {
        	background: linear-gradient(to top, ${config.colors.iris.hex} 30%, ${config.colors.rose.hex} 30%);
        }
        #pulseaudio.twenty {
        	background: linear-gradient(to top, ${config.colors.iris.hex} 20%, ${config.colors.rose.hex} 20%);
        }
        #pulseaudio.ten {
        	background: linear-gradient(to top, ${config.colors.iris.hex} 10%, ${config.colors.rose.hex} 10%);
        }
        #pulseaudio.zero {
        	background: linear-gradient(to top, ${config.colors.iris.hex} 0%, ${config.colors.rose.hex} 00%);
        }
        #pulseaudio.muted {
        	font-weight: 900;
        	background:${config.colors.gold.hex};
        }

        #tray {
        	/* background: #505050; */
        	/* padding: 5px 10px; */
        	margin: 10px 10px 0px 10px;
        	color: ${config.colors.gold.hex};
                    border-radius: 5px;

        }

        #tray menu {
        	color: ${config.colors.gold.hex};
                    border-radius: 5px;

        }

        #custom-hyprgows1 {
          color: ${config.colors.base.hex};
          background: ${config.colors.base.hex};
          padding: 0px 5px;
        	margin-right: 5px;
          margin-top: 5px;
        	margin-left: 5px;
                    border-radius: 5px;

        }

        #custom-hyprgows2 {
          color: ${config.colors.base.hex};
          background: ${config.colors.base.hex};
          padding: 0px 5px;
        	margin-right: 5px;
                    margin-top: 5px;
          border-radius: 5px;

        	margin-left: 5px;
        }

        #custom-hyprgows3 {
          color: ${config.colors.base.hex};
          background: ${config.colors.base.hex};
          padding: 0px 5px;
        	margin-right: 5px;
        	margin-left: 5px;
                    margin-top: 5px;
          border-radius: 5px;

        }

        #custom-hyprgows4 {
          color: ${config.colors.base.hex};
          background: ${config.colors.base.hex};
          padding: 0px 5px;
        	margin-right: 5px;
        	margin-left: 5px;
                    margin-top: 5px;
          border-radius: 5px;

        }
        #custom-hyprgows5 {
          color: ${config.colors.base.hex};
          background: ${config.colors.base.hex};
          padding: 0px 5px;
        	margin-right: 5px;
        	margin-left: 5px;
                    margin-top: 5px;
          border-radius: 5px;

        }

        #custom-hyprgows6 {
          color: ${config.colors.base.hex};
          background: ${config.colors.base.hex};
          padding: 0px 5px;
        	margin-right: 5px;
        	margin-left: 5px;
                    margin-top: 5px;
                              border-radius: 5px;


        }

          #custom-hyprgows7 {
          color: ${config.colors.base.hex};
          background: ${config.colors.base.hex};
          padding: 0px 5px;
        	margin-right: 5px;
        	margin-left: 5px;
                    margin-top: 5px;
                              border-radius: 5px;


        }

        #custom-hyprgows8 {
          color: ${config.colors.base.hex};
          background: ${config.colors.base.hex};
          padding: 0px 5px;
        	margin-right: 5px;
        	margin-left: 5px;
          margin-top: 5px;
          border-radius: 5px;

        }

        #custom-hyprgows9 {
          color: ${config.colors.base.hex};
          background: ${config.colors.base.hex};
          padding: 0px 5px;
        	margin-right: 5px;
        	margin-left: 5px;
          margin-top: 5px;
                    border-radius: 5px;

        }
        #custom-hyprgows1.occupied {
          color: ${config.colors.base.hex};
          background: ${config.colors.foam.hex};
        }
         #custom-hyprgows2.occupied {
          color: ${config.colors.base.hex};
          background: ${config.colors.foam.hex};
        }
                 #custom-hyprgows3.occupied {
          color: ${config.colors.base.hex};
          background: ${config.colors.foam.hex};
        }
         #custom-hyprgows4.occupied {
          color: ${config.colors.base.hex};
          background: ${config.colors.foam.hex};
        }
         #custom-hyprgows5.occupied {
          color: ${config.colors.base.hex};
          background: ${config.colors.foam.hex};
        }
         #custom-hyprgows6.occupied {
          color: ${config.colors.base.hex};
          background: ${config.colors.foam.hex};
        }
         #custom-hyprgows7.occupied {
          color: ${config.colors.base.hex};
          background: ${config.colors.foam.hex};
        }
         #custom-hyprgows8.occupied {
          color: ${config.colors.base.hex};
          background: ${config.colors.foam.hex};
        }
         #custom-hyprgows9.occupied {
          color: ${config.colors.base.hex};
          background: ${config.colors.foam.hex};
        }

                #custom-hyprgows1.active {
          color: ${config.colors.base.hex};
          background: ${config.colors.love.hex};
        }
         #custom-hyprgows2.active {
          color: ${config.colors.base.hex};
          background: ${config.colors.love.hex};
        }
                 #custom-hyprgows3.active {
          color: ${config.colors.base.hex};
          background: ${config.colors.love.hex};
        }
         #custom-hyprgows4.active {
          color: ${config.colors.base.hex};
          background: ${config.colors.love.hex};
        }
         #custom-hyprgows5.active {
          color: ${config.colors.base.hex};
          background: ${config.colors.love.hex};
        }
         #custom-hyprgows6.active {
          color: ${config.colors.base.hex};
          background: ${config.colors.love.hex};
        }
         #custom-hyprgows7.active {
          color: ${config.colors.base.hex};
          background: ${config.colors.love.hex};
        }
         #custom-hyprgows8.active {
          color: ${config.colors.base.hex};
          background: ${config.colors.love.hex};
        }
         #custom-hyprgows9.active {
          color: ${config.colors.base.hex};
          background: ${config.colors.love.hex};
        }

      '';
    };
  };
}
