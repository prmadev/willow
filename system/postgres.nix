{pkgs, ...}: {
  specialisation.postgres.configuration = {
    services.postgresql = {
      enable = true;

      ensureDatabases = ["prma"];
      ensureUsers = [
        {
          name = "prma";
          ensureDBOwnership = true;
        }
      ];
      initialScript = pkgs.writeText "init-sql-script" ''
        alter user prma with password 'hallo';
      '';
    };
  };
}
