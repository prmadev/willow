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
      enable = false;
      # package = pkgs.mongodb-4_2;
    };
    environment.systemPackages = with pkgs; [
      mongodb-compass
    ];
  };
}
