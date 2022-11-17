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
      pgcli
      python310Packages.keyring
      pgweb
      # gobang
    ];

    # services.pgadmin.enable = true;
    containers.database = {
      config = {
        config,
        pkgs,
        ...
      }: {
        services.postgresql = {
          enable = true;
          port = 5432;
          ensureUsers = [
            {
              name = "superuser";
              ensurePermissions = {
                "ALL TABLES IN SCHEMA public" = "ALL PRIVILEGES";
              };
            }
            {
              name = "a";
              ensurePermissions = {
                "ALL TABLES IN SCHEMA public" = "ALL PRIVILEGES";
              };
            }
          ];
          ensureDatabases = [
            "work"
          ];
        };

        services.pgadmin.initialEmail = "amirhossein.alesheikh@gmail.com";

        services.pgadmin.initialPasswordFile = ./enter;
      };
    };
    # services.pgadmin.
  };
}
