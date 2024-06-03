{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.freeze.enable = mkEnableOption "freeze settings";
  config = mkIf config.freeze.enable {
    home.packages = with pkgs; [charm-freeze];
  };
}
