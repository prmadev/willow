{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.watchexec.enable = mkEnableOption "watchexec settings";
  config = mkIf config.watchexec.enable {
    home.packages = with pkgs; [watchexec];
  };
}
