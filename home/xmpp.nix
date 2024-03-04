{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.xmpp.enable = mkEnableOption "xmpp settings";
  config = mkIf config.xmpp.enable {
    home.packages = with pkgs; [dino profanity];
  };
}
