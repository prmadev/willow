{
  config,
  pkgs,
  ...
}: {
  boot.loader.systemd-boot.enable = true;
  # boot.loader.systemd-boot.configurationLimit = 120;
  # boot.loader.generationsDir.enable = true;

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    # grub = {
    #   enable = true;
    #   device = "nodev";
    #   splashMode = "normal";
    #   efiSupport = true;
    #   backgroundColor = "#1e1e2e";
    #   # efiInstallAsRemovable = true;
    # };
  };
}
