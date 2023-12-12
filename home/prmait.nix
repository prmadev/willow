{
  lib,
  config,
  inputs,
  pkgs,
  system,
  ...
}:
with lib; {
  options.prmait.enable = mkEnableOption "prmait settings";
  config = mkIf config.prmait.enable {
    home.packages = with inputs.prmait.packages.${system}; [rvr jnl tsk];
    home.file = {
      ".config/leafslug/jnl.json" = {
        source = pkgs.writeTextFile {
          name = "jnl.json";
          text = builtins.toJSON {
            "time_offset" = [3 30 0];
            path = "${config.repos.notes.path}/journal/";
            file_name_format = "[year]-[month]-[day]-[hour]-[minute]-[second].json";
          };
        };
      };
      ".config/leafslug/tsk.json" = {
        source = pkgs.writeTextFile {
          name = "tsk.json";
          text = builtins.toJSON {
            "time_offset" = [3 30 0];
            path = "${config.repos.notes.path}/task/";
            file_name_format = "[year]-[month]-[day]-[hour]-[minute]-[second].json";
          };
        };
      };
      ".config/leafslug/rvr.json" = {
        source = pkgs.writeTextFile {
          name = "rvr.json";
          text = let
            c = config.colors.macchiato;
          in
            builtins.toJSON {
              border_width = 5;
              colors = {
                background = "0x" + c.base.rawHex;
                border_focused = "0x" + c.text.rawHex;
                border_unfocused = "0x" + c.base.rawHex;
                border_urgent = "0x" + c.maroon.rawHex;
              };
              hardware = {
                pointer = {name = "pointer-1739-30385-CUST0001:00_06CB:76B1_Touchpad";};
                lid = {
                  name = "switch-0-5-Lid_Switch";
                  on_lid_open = "${pkgs.wlr-randr}/bin/wlr-randr --output eDP-1 --on";
                  on_lid_close = "${pkgs.wlr-randr}/bin/wlr-randr --output eDP-1 --off";
                };
              };
              apps = {
                terminal = config.terminal;
                launcher = config.launcher;
                player_ctl = "${pkgs.playerctl}/bin/playerctl";
                volume_up = "${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
                volume_down = "${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
                volume_mute = "${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
                brightness_up = "${pkgs.brightnessctl}/bin/brightnessctl s 10%+";
                brightness_down = "${pkgs.brightnessctl}/bin/brightnessctl s 10%-";
              };
              startups = [
                {
                  executible = "riverctl";
                  args = ["spawn" "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=river"];
                }
                {
                  executible = "riverctl";
                  args = ["spawn" "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=river"];
                }
                # {
                #   executible = "${pkgs.dbus}/bin/dbus-update-activation-environment";
                #   args = [
                #     "seatd_sock"
                #     "display"
                #     "wayland_display"
                #     "xdg_session_type"
                #     "xdg_current_desktop"
                #   ];
                # }
                {
                  executible = "riverctl";
                  args = ["spawn" "systemctl restart --user waybar"];
                }
                {
                  executible = "${pkgs.wl-clipboard}/bin/wl-paste";
                  args = ["-t" "text" "--watch" "clipman" "store"];
                }
                {
                  executible = "${pkgs.river}/bin/rivertile";
                  args = ["-view-padding" "05" "-outer-padding" "05"];
                }
              ];
            };
        };
      };
    };
    programs.fish.interactiveShellInit = ''
      ${inputs.prmait.packages.${system}.rvr}/bin/rvr completions fish | source;
      ${inputs.prmait.packages.${system}.jnl}/bin/jnl completions fish | source;
      ${inputs.prmait.packages.${system}.tsk}/bin/tsk completions fish | source;
    '';
    programs.zsh.initExtra = ''
      if [[ $options[zle] = on ]]; then
         eval "$(${inputs.prmait.packages.${system}.rvr}/bin/rvr completions zsh)";
         eval "$(${inputs.prmait.packages.${system}.jnl}/bin/jnl completions zsh)";
         eval "$(${inputs.prmait.packages.${system}.tsk}/bin/tsk completions zsh)";
      fi
    '';

    programs.nushell = {
      extraEnv = ''
        ${inputs.prmait.packages.${system}.rvr}/bin/rvr completions zsh| save --force ${config.xdg.cacheHome}/rvr/init.nu;
        ${inputs.prmait.packages.${system}.jnl}/bin/jnl completions zsh| save --force ${config.xdg.cacheHome}/jnl/init.nu;
        ${inputs.prmait.packages.${system}.tsk}/bin/tsk completions zsh| save --force ${config.xdg.cacheHome}/tsk/init.nu;
      '';
      extraConfig = ''
        source ${config.xdg.cacheHome}/rvr/init.nu
        source ${config.xdg.cacheHome}/jnl/init.nu
        source ${config.xdg.cacheHome}/tsk/init.nu
      '';
    };
  };
}
