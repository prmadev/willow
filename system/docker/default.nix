{pkgs, ...}
: {
  virtualisation.docker = {
    enable = false;
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
