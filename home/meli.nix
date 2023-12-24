{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.meli.enable = mkEnableOption "meli settings";
  config = mkIf config.meli.enable {
    home.packages = with pkgs; [meli];
  };
}
