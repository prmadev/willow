{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    systemd.target = "river-session.target";
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
      	font-family: "Dank Mono Bold","Gintronic Black", "Recursive Sans Casual Static", "JetBrainsMono Nerd Font";
      	font-size: 12px;
      	min-height: 20px;
      	border-radius: 0px;
      }

      window#waybar {
      	background: transparent;
      	border-radius: 0px;
      }
      tooltip {
      	background: #ebbcba;
      }

      tooltip label {
      	color: #191724;
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
      	background: #1f1d2e;
      }

      #tags button.occupied {
      	border-radius: 0px;
      	font-weight: 900;
      	color: #191724;
      	background: #31748f;
      }

      #tags button.focused {
      	font-weight: 900;
      	color: #191724;
      	background: #ebbcba;
      }

      #tags button.urgent {
      	color: #e0def4;
      	background-color: #eb6f92;
      	border-radius: 0px;
      }

      #custom-date,
      #clock,
      #battery,
      #pulseaudio,
      #network,
      #custom-joljol {
      	color: #e0def4;
      	background: #1f1d2e;
      	padding: 2.5px 15px;
      	margin: 10px 10px 0px 0px;
      	font-weight: 900;
      }

      #clock {
      	color: #ebbcba;
      }

      #custom-joljol {
      	color: #ebbcba;
      	margin: 10px 10px 0px 10px;
      }

      #battery {
      	background: #31748f;
      	color: #191724;
      }

      /* #battery.charging { */
      /* 	color: #9ccfd8; */
      /* } */

      #battery.ninty.charging {
      	background: linear-gradient(to right, #31748f 90%, #9ccfd8 90%);
      }
      #battery.ninty:not(.charging) {
      	background: linear-gradient(to right, #31748f 90%, #ebbcba 90%);
      }
      #battery.eighty.charging {
      	background: linear-gradient(to right, #31748f 80%, #9ccfd8 80%);
      }
      #battery.eighty:not(.charging) {
      	background: linear-gradient(to right, #31748f 80%, #ebbcba 80%);
      }
      #battery.seventy.charging {
      	background: linear-gradient(to right, #31748f 70%, #9ccfd8 70%);
      }
      #battery.seventy:not(.charging) {
      	background: linear-gradient(to right, #31748f 70%, #ebbcba 70%);
      }
      #battery.sixty.charging {
      	background: linear-gradient(to right, #31748f 60%, #9ccfd8 60%);
      }
      #battery.sixty:not(.charging) {
      	background: linear-gradient(to right, #31748f 60%, #ebbcba 60%);
      }
      #battery.fifty.charging {
      	background: linear-gradient(to right, #31748f 50%, #9ccfd8 50%);
      }
      #battery.fifty:not(.charging) {
      	background: linear-gradient(to right, #31748f 50%, #ebbcba 50%);
      }
      #battery.fourty.charging {
      	background: linear-gradient(to right, #31748f 40%, #9ccfd8 40%);
      }
      #battery.fourty:not(.charging) {
      	background: linear-gradient(to right, #31748f 40%, #ebbcba 40%);
      }
      #battery.thirty.charging {
      	background: linear-gradient(to right, #31748f 30%, #9ccfd8 30%);
      }
      #battery.thirty:not(.charging) {
      	background: linear-gradient(to right, #31748f 30%, #ebbcba 30%);
      }
      #battery.twenty.charging {
      	background: linear-gradient(to right, #31748f 20%, #9ccfd8 20%);
      }
      #battery.twenty:not(.charging) {
      	background: linear-gradient(to right, #31748f 20%, #eb6f92 20%);
      }
      #battery.ten.charging {
      	background: linear-gradient(to right, #31748f 10%, #9ccfd8 10%);
      }
      #battery.ten:not(.charging) {
      	background: linear-gradient(to right, #31748f 10%, #eb6f92 10%);
      }
      #battery.five.charging {
      	background: linear-gradient(to right, #31748f 5%, #9ccfd8 5%);
      }
      #battery.five:not(.charging) {
      	background: linear-gradient(to right, #31748f 5%, #eb6f92 5%);
      }
      #battery.three.charging {
      	background: linear-gradient(to right, #31748f 3%, #9ccfd8 3%);
      }
      #battery.three:not(.charging) {
      	background: linear-gradient(to right, #31748f 3%, #eb6f92 3%);
      }
      #network {
      	color: #31748f;
      }

      #pulseaudio {
      	background: #c4a7e7;
      	color: #191724;
      }
      #pulseaudio.ninty {
      	background: linear-gradient(to top, #c4a7e7 90%, #908caa 90%);
      }
      #pulseaudio.eighty {
      	background: linear-gradient(to top, #c4a7e7 80%, #908caa 80%);
      }
      #pulseaudio.seventy {
      	background: linear-gradient(to top, #c4a7e7 70%, #908caa 70%);
      }
      #pulseaudio.sixty {
      	background: linear-gradient(to top, #c4a7e7 60%, #908caa 60%);
      }
      #pulseaudio.fifty {
      	background: linear-gradient(to top, #c4a7e7 50%, #908caa 50%);
      }
      #pulseaudio.fourty {
      	background: linear-gradient(to top, #c4a7e7 40%, #908caa 40%);
      }
      #pulseaudio.thirty {
      	background: linear-gradient(to top, #c4a7e7 30%, #908caa 30%);
      }
      #pulseaudio.twenty {
      	background: linear-gradient(to top, #c4a7e7 20%, #908caa 20%);
      }
      #pulseaudio.ten {
      	background: linear-gradient(to top, #c4a7e7 10%, #908caa 10%);
      }
      #pulseaudio.zero {
      	background: linear-gradient(to top, #c4a7e7 0%, #908caa 00%);
      }
      #pulseaudio.muted {
      	font-weight: 900;
      	background: #eb6f92;
      }

      #tray {
      	/* background: #505050; */
      	/* padding: 5px 10px; */
      	margin: 10px 10px 0px 10px;
      	color: #e0def4;
      }

      #tray menu {
      	color: #e0def4;
      }

    '';
  };
}
