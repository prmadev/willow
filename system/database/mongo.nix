{
  config,
  pkgs,
  lib,
  ...
}:
with lib; {
  options = {
    mongo.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.mongo.enable {
    services.mongodb = {
      enable = true;
      package = pkgs.mongodb-5_0;
    };
  };
}
