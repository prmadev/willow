{pkgs, ...}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ]; # Audio
  sound.enable = true;
  sound.mediaKeys.enable = true;
  # hardware.pulseaudio.enable = true;
  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    audio.enable = true;
    jack.enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  hardware.bluetooth.enable = true;
  services.printing.enable = false;
  services.blueman.enable = true;
  # System management
  services.dbus.enable = true;

  # Power management
  services.tlp.enable = true;
  # SSD management
  services.fstrim.enable = true;
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_0;
  # services.xserver.libinput.enable = true;
  hardware.opengl.enable = true;
  environment.systemPackages = with pkgs; [
    ntfs3g
    pciutils
    pipewire.pulse
    nvme-cli
    libbpf
  ];

  services.fwupd = {
    # bios updating tool
    enable = true;
  };
  services.udisks2 = {
    # needed by fwupd
    enable = true;
  };

  ## intel specific
  boot.kernelParams = [
    "mem_sleep_default=freeze"
    "i915.enable_fbc=1"
    "i915.enable_psr=2"
  ];
  boot.initrd.kernelModules = ["i915"];
  services.thermald.enable = true;

  environment.variables = {
    VDPAU_DRIVER = "va_gl";
  };

  hardware.opengl.extraPackages = with pkgs; [
    vaapiIntel
    libvdpau-va-gl
    intel-media-driver
  ];
  systemd.sleep.extraConfig = "SuspendState=deep";
}
