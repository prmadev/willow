{
  config,
  pkgs,
  lib,
  ...
}:
with lib; {
  options = {
    database.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.database.enable {
    environment.systemPackages = with pkgs; [
      mongodb-compass
      # pgcli
      # python310Packages.keyring
      # pgweb
      # gobang
    ];
    services.postgresql = {
      enable = false;

      enableTCPIP = true;
      port = 5432;
      # package = pkgs.postgresql_15;

      authentication = "host all all 10.233.0.0/16 trust";
      ensureUsers = [
        {
          name = "superuser";
          ensurePermissions = {
            "ALL TABLES IN SCHEMA public" = "ALL PRIVILEGES";
            "DATABASE work" = "ALL PRIVILEGES";
          };
        }
        {
          name = "a";
          ensurePermissions = {
            # "ALL TABLES IN SCHEMA public" = "ALL PRIVILEGES";
            "DATABASE work" = "ALL PRIVILEGES";
          };
        }
      ];
      ensureDatabases = [
        "work"
      ];
    };

    services.pgadmin.enable = false;
    services.pgadmin.initialEmail = "amirhossein.alesheikh@gmail.com";
    services.pgadmin.initialPasswordFile = ./enter;
  };
  # services.pgadmin.
}
