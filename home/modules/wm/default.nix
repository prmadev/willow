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
    ./picom.nix
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
    eww.enable = false;
    hyprland.enable = false;
    sway.enable = true;

    xsession.windowManager.awesome.enable = true;
    picom.enable = true;
    home.packages = with pkgs; [
      # xorg.xorgserver
    ];
  };
}
