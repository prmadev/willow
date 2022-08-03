{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    xdgconf.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.xdgconf.enable {
    xdg = {
      enable = true;
      mime.enable = true;
      # mimeApps.enable = true;
      userDirs.enable = true;
      # userDirs.createDirectories = true;
    };
  };
}
