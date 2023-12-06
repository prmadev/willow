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
      initer = {
        executable = true;
        source = pkgs.writeShellScript "river-initer" ''
          rvr
        '';
        target = ".config/river/init";
      };
      # tmuxPicker = {
      #   enable = true;
      #   executable = true;
      #   source = pkgs.writeShellScript "tmux-picker" ''
      #     riverctl spawn "${pkgs.foot}/bin/foot ${pkgs.tmux}/bin/tmux new -A -s $(${pkgs.fuzzel}/bin/fuzzel --dmenu --log-level=none)"
      #   '';
      #   target = ".local/bin/tmux-picker";
      # };
    };
  };
}
