{...}: {
  specialisation.redis.configuration = {
    services.redis = {
      servers = {
        redict = {
          enable = true;
          masterAuth = "test";
        };
      };
    };
  };
}
