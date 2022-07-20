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
  config = {
    mako = mkIf config.wm.enable {
      enable = true;
    };
    launcher = mkIf config.wm.enable {
      enable = true;
    };

    wm.river = mkIf config.wm.enable {
      enable = true;
    };
  };
}
