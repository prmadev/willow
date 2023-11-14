{
  lib,
  config,
  ...
}:
with lib; {
  options.mbsync.enable = mkEnableOption "mbsync settings";
  config = mkIf config.mbsync.enable {
    services.mbsync = {
      enable = true;
    };
  };
}
