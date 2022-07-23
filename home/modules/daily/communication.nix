{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    communication = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };
  config = mkIf config.communication.enable {
    home.packages = with pkgs; [
      # fractal
      tdesktop
      weechat
    ];
  };
}
