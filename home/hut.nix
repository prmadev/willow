{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.hut.enable = mkEnableOption "hut settings";
  config = mkIf config.hut.enable {
    home.packages = with pkgs; [hut];
  };
}
