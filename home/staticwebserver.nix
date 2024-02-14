{
  lib,
  pkgs,
  config,
  ...
}:
with lib; {
  options.staticwebserver.enable = mkEnableOption "static-web-server settings";

  config = mkIf config.staticwebserver.enable {
    home.packages = with pkgs; [
      static-web-server
    ];
  };
}
