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
            realname = "Perma";
            nicks = ["prma"];
          }
        ];
        defaults = {
          nicks = ["prma"];
          realname = "Perma";
          join = [
            "permacomputing"
          ];
        };
      };
    };
  };
}
