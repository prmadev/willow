{
  config,
  pkgs,
  lib,
  ...
}:
with lib; {
  imports = [./mongo.nix];
  options = {
    database.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.database.enable {
    mongo.enable = true;
  };
}
