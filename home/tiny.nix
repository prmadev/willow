{
  lib,
  config,
  ...
}:
with lib; {
  options.tiny.enable = mkEnableOption "tiny settings";

  config = mkIf config.tiny.enable {
    programs.tiny = {
      enable = true;
      settings = {
        servers = [
          {
            addr = "irc.libera.chat";
            port = 6697;
            tls = true;
            realname = "Amir Alesheikh";
            nicks = ["amirography" "prma"];
          }
        ];
        defaults = {
          nicks = ["amirography" "prma"];
          realname = "Amir Alesheikh";
          join = [
            "permacomputing"
          ];
        };
      };
    };
  };
}
