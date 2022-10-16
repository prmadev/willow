{
  config,
  lib,
  ...
}:
with lib; {
  options = {
    syncthing.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.syncthing.enable {
    services.syncthing = {
      enable = true;
    };
  };
}
