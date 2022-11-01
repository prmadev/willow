{pkgs, ...}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ]; # Audio
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
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_0;
  # services.xserver.libinput.enable = true;
  hardware.opengl.enable = true;
  environment.systemPackages = with pkgs; [
    ntfs3g
    pciutils
  ];

  services.fwupd = {
    # bios updating tool
    enable = true;
  };
  services.udisks2 = {
    # needed by fwupd
    enable = true;
  };
}
