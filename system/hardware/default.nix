{pkgs, ...}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];
  # Audio
  sound.enable = true;
  sound.mediaKeys.enable = true;
  # hardware.pulseaudio.enable = true;
  services.pipewire.enable = true;
  services.pipewire.wireplumber.enable = true;
  services.pipewire.jack.enable = true;
  services.pipewire.alsa.enable = true;
  services.pipewire.pulse.enable = true;

  services.printing.enable = false;

  # System management
  services.dbus.enable = true;

  # Power management
  services.tlp.enable = true;
  services.fstrim.enable = true;
  # boot.kernelPackages = pkgs.linuxKernel.kernels.linux_5_19;
  # services.xserver.videoDrivers = ["nvidia"];
  # hardware.nvidia.modesetting.enable = true;
  # trackpad and mouse
  # services.xserver.libinput.enable = true;
  hardware.opengl.enable = true;
  # hardware.nvidia.enable = true;
  #hardware.nvidiaOptimus.disable = true;
  environment.systemPackages = with pkgs; [
    ntfs3g
    pciutils
    fwupd
  ];
}
