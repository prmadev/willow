{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options.hugo.enable = mkEnableOption "hugo settings";

  config = mkIf config.hugo.enable {
    home.packages = with pkgs; [hugo];
  };
}
