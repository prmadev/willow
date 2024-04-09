{pkgs, ...}: {
  networking.hostName = "nixer";
  networking.networkmanager = {
    enable = true;
    unmanaged = ["docker0" "rndis0"];
    # wifi.backend = "iwd";
  };

  services.connman = {
    enable = false;
    enableVPN = true;
    package = pkgs.connmanFull;
    wifi = {
      backend = "iwd"; # iwd
    };
  };

  services.https-dns-proxy.enable = true;

  services.tor = {
    # i want this as system level, because I need it for circumventing gitlab's sanctions.
    # enable = true;
    client.enable = true;
    client.transparentProxy.enable = true;
    client.dns.enable = true;
  };
  #  networking.proxy.default = "127.0.0.1:1080";
  # networking.useDHCP = false;
  # networking.enableIPv6 = false;
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  programs.gnupg.agent = {
    enable = true;
    enableBrowserSocket = true;
    enableExtraSocket = true;
    enableSSHSupport = false;
  };
  programs.ssh.knownHosts = {
    # github = {
    #   extraHostNames = ["github.com"];
    #   publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMBdfp2WO8FIN6dYb+fCUpJRmu2+bhI8kfrgVcdI5PRn prma.dev@protonmail.com";
    # };
    # codeberg = {
    #   extraHostNames = ["codeberg.org" "217.197.91.145"];
    #   publicKey = "SHA256 mIlxA9k46MmM6qdJOdMnAQpzGxF4WIVVL+fj+wZbw0g";
    # };
  };

  environment.variables.NIX_CURL_FLAGS = "";

  # networking.wireless.iwd = {
  #   enable = true;
  # };
  # environment.systemPackages = with pkgs; [iw];

  services.openssh.enable = false;

  networking.wireguard.enable = true;

  networking.firewall.checkReversePath = "loose";
  # networking.firewall.checkReversePath = false;
}
