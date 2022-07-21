{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    pager.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.pager.enable {
    programs.bat.enable = true;
    home.sessionVariables = {
      PAGER = "less";
      LESS = "-g -i -M -R -S -w -X -z-4";
    };
  };
}
