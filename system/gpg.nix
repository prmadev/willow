{...}: {
  programs.gnupg.agent = {
    enable = true;
    enableExtraSocket = true;
    enableBrowserSocket = true;
    enableSSHSupport = false;
    settings = {
      default-cache-ttl = 800000;
      default-cache-ttl-ssh = 800000;
    };
  };
}
