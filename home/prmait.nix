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
    home.packages = [inputs.prmait.packages.${system}.default];
    home.file = let
      content = pkgs.writeTextFile {
        name = "snippets-rust.json";
        text = let
          c = config.colors.macchiato;
        in
          builtins.toJSON {
            "journal" = {
              path = "${config.repos.notes.path}/journal/";
            };
            "task" = {
              path = "${config.repos.notes.path}/task/";
            };
            "river" = {
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
                terminal = "${pkgs.wezterm}/bin/wezterm";
                launcher = "${pkgs.fuzzel}/bin/fuzzel";
                player_ctl = "${pkgs.playerctl}/bin/playerctl";
                volume_up = "${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
                volume_down = "${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
                volume_mute = "${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
                brightness_up = "${pkgs.brightnessctl}/bin/brightnessctl s 10%+";
                brightness_down = "${pkgs.brightnessctl}/bin/brightnessctl s 10%-";
              };
              startups = [
                {
                  executible = "${pkgs.dbus}/bin/dbus-update-activation-environment";
                  args = [
                    "seatd_sock"
                    "display"
                    "wayland_display"
                    "xdg_session_type"
                    "xdg_current_desktop"
                  ];
                }
                {
                  executible = "systemctl";
                  args = ["restart" "--user" "waybar"];
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
            destination = "";
          };
      };
    in {
      ".config/prmait/config.json" = {
        source = content;
      };
    };
    programs.fish.interactiveShellInit = ''
      ${inputs.prmait.packages.${system}.default}/bin/prmait completions fish | source
    '';
    programs.zsh.initExtra = ''
      if [[ $options[zle] = on ]]; then
         eval "$(${inputs.prmait.packages.${system}.default}/bin/prmait completions zsh)"
      fi
    '';

    programs.nushell = {
      extraEnv = ''
        ${inputs.prmait.packages.${system}.default}/bin/prmait completions zsh| save --force ${config.xdg.cacheHome}/prmait/init.nu
      '';
      extraConfig = ''
        source ${config.xdg.cacheHome}/prmait/init.nu
      '';
    };
  };
}
