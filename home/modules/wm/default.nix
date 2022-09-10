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
    ./sway
    ./eww
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
    eww.enable = true;
    hyprland.enable = true;
    home.packages = with pkgs; [wayfire];
    xsession.windowManager.awesome.enable = true;
    sway.enable = true;
  };
}
