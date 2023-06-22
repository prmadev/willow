{
  lib,
  config,
  ...
}:
with lib; {
  options.irssi.enable = mkEnableOption "irssi settings";
  config = mkIf config.irssi.enable {
    programs.irssi = {
      enable = true;
      networks = {
        liberachat = {
          nick = "amirography";
          server = {
            address = "irc.libera.chat";
            port = 6697;
            autoConnect = true;
          };
          channels = {
            nixos.autoJoin = true;
            permacomputing.autoJoin = true;
          };
        };
      };
    };
  };
}
