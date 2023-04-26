{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options.hoard.enable = mkEnableOption "hoard settings";

  config = mkIf config.hoard.enable {
    home.packages = with pkgs; [
      hoard
    ];
  };
}
