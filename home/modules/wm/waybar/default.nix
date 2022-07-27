{ pkgs
, lib
, config
, ...
}:
with lib; {
  options.waybar = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = {
    programs.waybar = mkIf config.waybar.enable {
      enable = true;
      systemd.enable = true;
      settings = {
        mainBar = {
          gtk-layer-shell = true;
          position = "top";
          height = 0;
          modules-left = [
            "river/mode"
            "river/tags"
          ];
          modules-center = [
            "clock"
            "custom/joljol"
          ];

          modules-right = [
            "tray"
            "network"
            "pulseaudio"
            "battery"
          ];

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
        	border-radius: 0px;
        }

        window#waybar {
        	background: transparent;
        	border-radius: 0px;
        }
        tooltip {
        	background: ${config.cat.mocha.surface0.hex};
        }

        tooltip label {
        	color: ${config.cat.mocha.text.hex};
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
        	background: ${config.cat.mocha.crust.hex};
        }

        #tags button.occupied {
        	border-radius: 0px;
        	font-weight: bold;
        	color: ${config.cat.mocha.crust.hex};
        	background: ${config.cat.mocha.lavender.hex};
        }

        #tags button.focused {
        	font-weight: 900;
        	color: ${config.cat.mocha.crust.hex};
        	background: ${config.cat.mocha.flamingo.hex};
        }

        #tags button.urgent {
        	color: ${config.cat.mocha.crust.hex};
        	background-color: ${config.cat.mocha.red.hex};
        	border-radius: 0px;
        }

        #custom-date,
        #clock,
        #battery,
        #pulseaudio,
        #network,
        #custom-joljol {
        	background:${config.cat.mocha.blue.hex};
        	color:${config.cat.mocha.crust.hex} ;
        	padding: 2.5px 15px;
        	margin: 10px 10px 0px 0px;
        	font-weight: 900;
        }

        #clock {
        	background: ${config.cat.mocha.green.hex};
        }

        #custom-joljol {
        	background: ${config.cat.mocha.green.hex};
        	margin: 10px 10px 0px 10px;
        }

        #battery {
        	background: ${config.cat.mocha.green.hex};
        	color: ${config.cat.mocha.crust.hex};
        }

        /* #battery.charging { */
        /* 	color: #9ccfd8; */
        /* } */

        #battery.ninty.charging {
        	background: linear-gradient(to right, ${config.cat.mocha.green.hex} 90%, ${config.cat.mocha.blue.hex} 90%);
        }
        #battery.ninty:not(.charging) {
        	background: linear-gradient(to right, ${config.cat.mocha.green.hex} 90%, ${config.cat.mocha.flamingo.hex} 90%);
        }
        #battery.eighty.charging {
        	background: linear-gradient(to right, ${config.cat.mocha.green.hex} 80%, ${config.cat.mocha.blue.hex} 80%);
        }
        #battery.eighty:not(.charging) {
        	background: linear-gradient(to right, ${config.cat.mocha.green.hex} 80%, ${config.cat.mocha.flamingo.hex} 80%);
        }
        #battery.seventy.charging {
        	background: linear-gradient(to right, ${config.cat.mocha.green.hex} 70%, ${config.cat.mocha.blue.hex} 70%);
        }
        #battery.seventy:not(.charging) {
        	background: linear-gradient(to right, ${config.cat.mocha.green.hex} 70%, ${config.cat.mocha.flamingo.hex} 70%);
        }
        #battery.sixty.charging {
        	background: linear-gradient(to right, ${config.cat.mocha.green.hex} 60%, ${config.cat.mocha.blue.hex} 60%);
        }
        #battery.sixty:not(.charging) {
        	background: linear-gradient(to right, ${config.cat.mocha.green.hex} 60%, ${config.cat.mocha.flamingo.hex} 60%);
        }
        #battery.fifty.charging {
        	background: linear-gradient(to right, ${config.cat.mocha.green.hex} 50%, ${config.cat.mocha.blue.hex} 50%);
        }
        #battery.fifty:not(.charging) {
        	background: linear-gradient(to right, ${config.cat.mocha.green.hex} 50%, ${config.cat.mocha.flamingo.hex} 50%);
        }
        #battery.fourty.charging {
        	background: linear-gradient(to right, ${config.cat.mocha.green.hex} 40%, ${config.cat.mocha.blue.hex} 40%);
        }
        #battery.fourty:not(.charging) {
        	background: linear-gradient(to right, ${config.cat.mocha.green.hex} 40%, ${config.cat.mocha.flamingo.hex} 40%);
        }
        #battery.thirty.charging {
        	background: linear-gradient(to right, ${config.cat.mocha.green.hex} 30%, ${config.cat.mocha.blue.hex} 30%);
        }
        #battery.thirty:not(.charging) {
        	background: linear-gradient(to right, ${config.cat.mocha.green.hex} 30%, ${config.cat.mocha.flamingo.hex} 30%);
        }
        #battery.twenty.charging {
        	background: linear-gradient(to right, ${config.cat.mocha.green.hex} 20%, ${config.cat.mocha.blue.hex} 20%);
        }
        #battery.twenty:not(.charging) {
        	background: linear-gradient(to right, ${config.cat.mocha.green.hex} 20%, ${config.cat.mocha.red.hex} 20%);
        }
        #battery.ten.charging {
        	background: linear-gradient(to right, ${config.cat.mocha.green.hex} 10%, ${config.cat.mocha.blue.hex} 10%);
        }
        #battery.ten:not(.charging) {
        	background: linear-gradient(to right, ${config.cat.mocha.green.hex} 10%, ${config.cat.mocha.red.hex} 10%);
        }
        #battery.five.charging {
        	background: linear-gradient(to right, ${config.cat.mocha.green.hex} 5%, ${config.cat.mocha.blue.hex} 5%);
        }
        #battery.five:not(.charging) {
        	background: linear-gradient(to right, ${config.cat.mocha.green.hex} 5%, ${config.cat.mocha.red.hex} 5%);
        }
        #battery.three.charging {
        	background: linear-gradient(to right, ${config.cat.mocha.green.hex} 3%, ${config.cat.mocha.blue.hex} 3%);
        }
        #battery.three:not(.charging) {
        	background: linear-gradient(to right, ${config.cat.mocha.green.hex} 3%, ${config.cat.mocha.red.hex} 3%);
        }
        #network {
        	background: ${config.cat.mocha.green.hex};
        }

        #pulseaudio {
        	background: ${config.cat.mocha.mauve.hex};
        	color: ${config.cat.mocha.crust.hex};
        }
        #pulseaudio.ninty {
        	background: linear-gradient(to top, ${config.cat.mocha.mauve.hex} 90%, ${config.cat.mocha.pink.hex} 90%);
        }
        #pulseaudio.eighty {
        	background: linear-gradient(to top, ${config.cat.mocha.mauve.hex} 80%, ${config.cat.mocha.pink.hex} 80%);
        }
        #pulseaudio.seventy {
        	background: linear-gradient(to top, ${config.cat.mocha.mauve.hex} 70%, ${config.cat.mocha.pink.hex} 70%);
        }
        #pulseaudio.sixty {
        	background: linear-gradient(to top, ${config.cat.mocha.mauve.hex} 60%, ${config.cat.mocha.pink.hex} 60%);
        }
        #pulseaudio.fifty {
        	background: linear-gradient(to top, ${config.cat.mocha.mauve.hex} 50%, ${config.cat.mocha.pink.hex} 50%);
        }
        #pulseaudio.fourty {
        	background: linear-gradient(to top, ${config.cat.mocha.mauve.hex} 40%, ${config.cat.mocha.pink.hex} 40%);
        }
        #pulseaudio.thirty {
        	background: linear-gradient(to top, ${config.cat.mocha.mauve.hex} 30%, ${config.cat.mocha.pink.hex} 30%);
        }
        #pulseaudio.twenty {
        	background: linear-gradient(to top, ${config.cat.mocha.mauve.hex} 20%, ${config.cat.mocha.pink.hex} 20%);
        }
        #pulseaudio.ten {
        	background: linear-gradient(to top, ${config.cat.mocha.mauve.hex} 10%, ${config.cat.mocha.pink.hex} 10%);
        }
        #pulseaudio.zero {
        	background: linear-gradient(to top, ${config.cat.mocha.mauve.hex} 0%, ${config.cat.mocha.pink.hex} 00%);
        }
        #pulseaudio.muted {
        	font-weight: 900;
        	background:${config.cat.mocha.yellow.hex};
        }

        #tray {
        	/* background: #505050; */
        	/* padding: 5px 10px; */
        	margin: 10px 10px 0px 10px;
        	color: ${config.cat.mocha.yellow.hex};
        }

        #tray menu {
        	color: ${config.cat.mocha.yellow.hex};
        }

      '';
    };
  };
}
