{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.dateutils.enable = mkEnableOption "dateutils settings";
  config = mkIf config.dateutils.enable {
    home.packages = with pkgs; [dateutils];
  };
}
