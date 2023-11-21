{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options.mbsync.enable = mkEnableOption "mbsync settings";
  config = mkIf config.mbsync.enable {
    accounts.email.accounts.Personal.mbsync = {
      enable = true;
      create = "both";
      expunge = "both";
    };
    services.mbsync = {
      enable = true;
      frequency = "*:0/1";
    };
    programs.mbsync = {
      enable = true;
    };
    home.packages = with pkgs; [moreutils];
  };
}
