{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    bw.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.bw.enable {
    programs.rbw = {
      enable = true;
      settings = {
        email = "amirhossein.alesheikh@gmail.com";
        pinentry = "gtk2";
      };
    };

    home.sessionVariables = {
      BW_CLIENTID = /run/ragenix/bwid;
      BW_CLIENTSECRET = /run/ragenix/bwsec;
    };

    home.packages = with pkgs;
      mkIf config.launcher.rofi.enable [
        rofi-rbw # for password management
        wtype
        wl-clipboard
      ];
  };
}
