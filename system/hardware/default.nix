{
  config,
  pkgs,
  ...
}: {
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

  # System management
  services.dbus.enable = true;

  # Power management
  services.tlp.enable = true;

  # trackpad and mouse
  services.xserver.libinput.enable = false;
  hardware.opengl.enable = true;
  #hardware.nvidiaOptimus.disable = true;
}
