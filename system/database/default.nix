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
        networking.firewall.allowedTCPPorts = [5432];
        services.postgresql = {
          enable = true;

          enableTCPIP = true;
          port = 5432;

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
                "ALL TABLES IN SCHEMA public" = "ALL PRIVILEGES";

                "DATABASE a" = "ALL PRIVILEGES";
                "DATABASE work" = "ALL PRIVILEGES";
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
