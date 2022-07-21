{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  imports = [
    ./river
    ./waybar
    ./mako
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
