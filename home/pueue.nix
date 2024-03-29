{
  lib,
  config,
  ...
}:
with lib; {
  options.pueue.enable = mkEnableOption "pueue background jobs";

  config = mkIf config.pueue.enable {
    services.pueue = {
      enable = true;
      settings =  {
        shared = {
          use_unix_socket = true;
       
        };
      };
    };
  };
}
