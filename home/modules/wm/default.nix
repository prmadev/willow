{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
with lib; {
  imports = [
    ./river
    ./waybar
    ./mako
    ./hyprland.nix
  ];

  options.wm = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.wm.enable {
    mako.enable = true;
    launcher.enable = true;
    wm.river.enable = true;
  };
}
