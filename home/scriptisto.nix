{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.scriptisto.enable = mkEnableOption "scriptisto settings";
  config = mkIf config.scriptisto.enable {
    home.packages = with pkgs; [scriptisto];
  };
}
