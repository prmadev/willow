{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.niri.enable = mkEnableOption "niri settings";
  config = mkIf config.niri.enable {
    programs.niri = {
      enable = true;
    };
  };
}
