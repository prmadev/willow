{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.handlr.enable = mkEnableOption "handlr settings";
  config = mkIf config.handlr.enable {
    home.packages = with pkgs; [handlr];
  };
}
