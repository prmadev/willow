{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.wm.river = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.wm.river.enable {
    home.packages = [
      pkgs.river
      # pkgs.ristate
    ];
    waybar.enable = true;
    wayland.enable = true;

    home.sessionVariables = {
      # XKB_DEFAULT_LAYOUT = "us,ir";
      # XKB_DEFAULT_OPTIONS = "grp:alt_shift_toggle,caps:escape";
    };
  };
}
