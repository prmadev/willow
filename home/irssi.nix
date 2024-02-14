{
  lib,
  config,
  ...
}:
with lib; {
  options.irssi.enable = mkEnableOption "irssi settings";
  options.irssi.userName = mkOption {
    type = types.str;
    default = "prma";
  };
  options.irssi.realName = mkOption {
    type = types.str;
    default = "Perma";
  };
  options.irssi.nickName = mkOption {
    type = types.str;
    default = config.irssi.realName;
  };
  config = mkIf config.irssi.enable {
    programs.irssi = {
      enable = true;

      extraConfig = ''
        settings = {
          core = {
            real_name = "${config.irssi.realName}";
            user_name = "${config.irssi.userName}";
            nick = "${config.irssi.nickName}";
          };
      '';

      networks = {
        liberachat = {
          nick = config.irssi.nickName;
          server = {
            address = "irc.eu.libera.chat";
            port = 7000;
            autoConnect = true;
            ssl = {
              enable = true;
            };
          };
          saslExternal = true;
          channels = {
            nixos.autoJoin = true;
            permacomputing.autoJoin = true;
            "sr.ht".autoJoin = true;
          };
        };
      };
    };
  };
}
