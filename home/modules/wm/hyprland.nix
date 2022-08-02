{
  pkgs,
  inputs,
  config,
  lib,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
            exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY DISPLAY HYPRLAND_INSTANCE_SIGNATURE
            exec-once=systemctl --user start hyprland-session.target
            exec-once=swaybg -i ~/.config/wallpaper.jpg
            exec-once=xprop -root -f _XWAYLAND_GLOBAL_OUTPUT_SCALE 32c -set _XWAYLAND_GLOBAL_OUTPUT_SCALE 2

      general {
            sensitivity=0.6
            main_mod=SUPER
            gaps_in=10
            gaps_out=10
            border_size=5
          }    '';
  };
}
