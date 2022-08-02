{
  pkgs,
  inputs,
  config,
  lib,
  ...
}: {
  wayland.windowManager.hyprland.enable = true;
}
