{
  lib,
  pkgs,
  config,
  ...
}:
with lib; {
  options.soup.enable = mkEnableOption "soupault settings";

  config = mkIf config.soup.enable {
    home.packages = with pkgs; [
      soupault
      static-web-server
      highlight
    ];
  };
}
