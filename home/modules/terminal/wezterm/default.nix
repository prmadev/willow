{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    wezterm.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.wezterm.enable {
    home.packages = with pkgs; [
      wezterm
    ];
    #TODO configure it.
  };
}
