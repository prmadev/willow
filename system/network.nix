_: {
  networking.hostName = "nixer";
  networking.networkmanager = {
    enable = true;
    unmanaged = ["docker0" "rndis0"];
  };

  services.https-dns-proxy = {
    enable = true;
  };
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
    enableSSHSupport = true;
  };

  environment.variables = {
    NIX_CURL_FLAGS = "";
  };

  services.openssh.enable = true;

  networking.wireguard = {
    # enable = true;
  };
  networking.firewall.checkReversePath = false;
}
