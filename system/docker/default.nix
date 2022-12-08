{pkgs, ...}
: {
  virtualisation.docker = {
    enable = false;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
    storageDriver = "btrfs";
  };
  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
