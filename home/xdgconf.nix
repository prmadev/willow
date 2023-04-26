{
  lib,
  config,
  ...
}:
with lib; {
  options.xdgconf.enable = mkEnableOption "xdg config settings";

  config = mkIf config.xdgconf.enable {
    xdg = {
      enable = true;
      mime.enable = true;
      userDirs.enable = true;
      # userDirs.createDirectories = true;

      # mimeApps.enable = true;
    };
  };
}
