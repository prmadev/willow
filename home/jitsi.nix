{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.jitsi.enable = mkEnableOption "jitsi settings";
  config = mkIf config.jitsi.enable {
    home.packages = with pkgs; [jitsi jitsi-meet];
  };
}
