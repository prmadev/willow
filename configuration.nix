{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  programs.xwayland.enable = true;

  security.polkit.enable = true;

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  environment.variables = {
    NIX_CURL_FLAGS = "-x socks://127.0.0.1:9050/";
  };
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  #hardware.nvidiaOptimus.disable = true;
}
