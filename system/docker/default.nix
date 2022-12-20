{pkgs, ...}
: {
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = false;
      # setSocketVariable = true;
    };
    # storageDriver = "btrfs";
  };
  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
