{pkgs, ...}: {
  virtualisation.podman = {
    enable = true;
    dockerSocket.enable = true;
    dockerCompat = true;
    defaultNetwork.dnsname.enable = true; # for arion
  };
  environment.systemPackages = [
    pkgs.arion # for arion
    pkgs.docker-client # for arion
  ];
}
