{
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
      userDirs.enable = true;
      # userDirs.createDirectories = true;

      mimeApps.enable = true;
      mimeApps.defaultApplications = {
        "application/pdf" = "org.pwmt.zathura.desktop";
        "image/*" = [
          "imv.desktop"
        ];
        "text/*" = [
          "hx.desktop"
          "lvim.dekstop"
          "nvim.desktop"
        ];
      };
    };
  };
}
