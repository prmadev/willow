{...}: {
  programs.gnupg.agent = {
    enable = true;
    enableExtraSocket = true;
    enableBrowserSocket = true;
    enableSSHSupport = true;
    settings = {
      default-cache-ttl = 0;
    };
  };
}
