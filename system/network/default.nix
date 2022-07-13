{
  config,
  pkgs,
  ...
}: {
  networking.hostName = "nixer";
  networking.networkmanager.enable = true;

  services.tor = {
    # i want this as system level, because I need it for circumventing gitlab's sanctions.
    enable = true;
    client.enable = true;
  };
  networking.proxy.default = "socks5://127.0.0.1:7890/";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  environment.variables = {
    NIX_CURL_FLAGS = "-x socks://127.0.0.1:9050/";
  };
  services.openssh.enable = true;
}
