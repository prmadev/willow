{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.river.enable = mkEnableOption "riverwm settings";
  config = mkIf config.river.enable {
    home.packages = with pkgs; [
      wlr-randr
    ];
    waybar.enable = true;
    wayland.enable = true;

    home.sessionVariables = {
      XKB_DEFAULT_LAYOUT = "us,ir";
      XKB_DEFAULT_OPTIONS = "grp:alt_shift_toggle,caps:escape";
    };

    home.file = {
      tmuxPicker = {
        enable = true;
        executable = true;
        source = pkgs.writeShellScript "tmux-picker" ''
          smug_list=$(smug list)

          chosen=$(echo "$smug_list" | rofi -dmenu)

          if [[ -z "$chosen"  ]]; then
            exit 0
           else

          if [[ "$smug_list" == *"$chosen"* ]]; then
              foot smug "$chosen" -a
            else
              foot tmux new -s "$chosen"
          fi

          fi

        '';
        target = ".local/bin/tmux-picker";
      };
    };
  };
}
