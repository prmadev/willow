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
    environment.systemPackages = with pkgs; [
      pgcli
      python310Packages.keyring
      pgweb
      gobang
    ];

    # services.pgadmin.enable = true;
    services.postgresql.enable = true;
    services.pgadmin.initialEmail = "amirhossein.alesheikh@gmail.com";

    services.pgadmin.initialPasswordFile = ./enter;
    # services.pgadmin.
  };
}
