{
  lib,
  config,
  ...
}:
with lib; {
  options.panta.enable = mkEnableOption "pantalaimon settings";

  config = mkIf config.panta.enable {
    services.pantalaimon = {
      enable = true;
      settings = {
        local-matrix = {
          Homeserver = "https://tchncs.de";
          ListenAddress = "127.0.0.1";
          ListenPort = 8898;
        };
      };
    };
  };
}
