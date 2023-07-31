{
  lib,
  config,
  ...
}:
with lib; {
  options.senpai.enable = mkEnableOption "senpai settings";
  config = mkIf config.senpai.enable {
    programs.senpai = {
      enable = true;
      config = {
        addr = "libera.chat:6697";
        nick = "prma";
      };
    };
  };
}
