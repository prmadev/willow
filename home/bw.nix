{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.bw.enable = mkEnableOption "bitwarden settings";

  config = mkIf config.bw.enable {
    programs.rbw = {
      enable = true;
      settings = {
        email = "prma.dev@protonmail.com";
        pinentry = "gtk2";
      };
    };

    home.sessionVariables = {
      BW_CLIENTID = /run/ragenix/bwid;
      BW_CLIENTSECRET = /run/ragenix/bwsec;
    };

    home.packages = with pkgs;
      mkIf config.rofi.enable [
        rofi-rbw # for password management
        wtype
        wl-clipboard
        prs
        ripasso-cursive
        gopass
        pass
        tessen
      ];
  };
}
