{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.centerpiece.enable = mkEnableOption "centerpiece settings";
  config = mkIf config.centerpiece.enable {
    programs.centerpiece.enable = true;
  };
}
