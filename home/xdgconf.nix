{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options.xdgconf.enable = mkEnableOption "xdg config settings";

  config = mkIf config.xdgconf.enable {
    home.packages = with pkgs; [xdg-utils];
    xdg = {
      enable = true;
      mime.enable = true;
      userDirs.enable = true;

      # userDirs.createDirectories = true;

      # mimeApps.enable = true;
    };
  };
}
