{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options.fluffychat.enable = mkEnableOption "fluffychat matrix settings";

  config = mkIf config.fluffychat.enable {
    home.packages = with pkgs;[
     fluffychat
    ];
  };
}
