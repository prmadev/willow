{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.pass.enable = mkEnableOption "pass settings";
  config = mkIf config.pass.enable {
    programs.password-store = {
      enable = true;
      package = pkgs.pass-wayland.withExtensions (exts: [exts.pass-file exts.pass-update exts.pass-import exts.pass-checkup exts.pass-genphrase]);
      settings = {
        PASSWORD_STORE_DIR = "${config.repos.path}/pass";
      };
    };
    home.packages = with pkgs; [gopass];
  };
}
