{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.vieb.enable = mkEnableOption "vieb settings";
  config = mkIf config.vieb.enable {
    home.packages = with pkgs; [
      vieb
    ];
  };
}
