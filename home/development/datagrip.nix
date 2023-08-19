{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.datagrip.enable = mkEnableOption "datagrip settings";
  config = mkIf config.datagrip.enable {
    home.packages = with pkgs; [
      jetbrains.datagrip
    ];
  };
}
