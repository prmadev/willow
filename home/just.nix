{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.just.enable = mkEnableOption "just settings";
  config = mkIf config.just.enable {
    home.packages = with pkgs; [just];
  };
}
