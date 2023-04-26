{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.partition.enable = mkEnableOption "storage settings";

  config = mkIf config.partition.enable {
    home.packages = with pkgs; [
      gparted
    ];
  };
}
