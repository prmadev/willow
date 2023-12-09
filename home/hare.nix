{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.hare.enable = mkEnableOption "hare settings";
  config = mkIf config.hare.enable {
    home.packages = with pkgs; [
      hare
    ];
  };
}
