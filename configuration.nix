{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixer";
  networking.networkmanager.enable = true;

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Asia/Tehran";

  services.tor = {
    # i want this as system level, because I need it for circumventing gitlab's sanctions.
    enable = true;
    client.enable = true;
  };
  networking.proxy.default = "socks5://127.0.0.1:9050/";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    #  keyMap = "us";
    #  useXkbConfig = true; # use xkbOptions in tty.
  };

  # I don't want any stinky display manager :D
  services.xserver.displayManager.gdm.enable = false;
  services.xserver.displayManager.lightdm.enable = false;
  services.xserver.displayManager.sddm.enable = false;

  services.xserver.layout = "us";
  # services.xserver.xkbOptions = {
  #   "eurosign:e";
  # "caps:escape" # map caps to escape.
  # };

  sound.enable = true;
  sound.mediaKeys.enable = true;
  # hardware.pulseaudio.enable = true;
  services.pipewire.enable = true;
  services.pipewire.wireplumber.enable = true;
  services.pipewire.jack.enable = true;
  services.pipewire.alsa.enable = true;
  services.pipewire.pulse.enable = true;
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  services.xserver.libinput.enable = true;
  services.tlp.enable = true;
  programs.xwayland.enable = true;

  users.defaultUserShell = pkgs.zsh;
  users.users.a = {
    createHome = true;
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video" # for wayland light support
    ];
  };
  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
    };
    vteIntegration = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };

  programs.git.enable = true;
  environment.pathsToLink = ["/share/zsh"];
  environment.systemPackages = with pkgs; [
    fd
    ripgrep-all
    neovim #just in case I need it at system level
    river # my favorite window manager in wayland
    curl # obvious

    clash # for networking
    glib #for wayland gsettings
    slurp # for wayland
    grim # for wayland
    wl-clipboard
    rofi-rbw # for password management
    android-file-transfer
    atool # for file extraction
    clipman # for wayland
    duf
    du-dust
    ncdu_2
    dutree
    exercism
    ffmpeg_5-full
    ffmpegthumbnailer
    gparted
    imv
    lsof
    libreoffice-bin
    mediainfo
    imagemagick
    brightnessctl
    networkmanager_dmenu
    mprocs
    pastel
    pavucontrol
    pigz
    playerctl
    procs
    pueue
    pulsemixer
    qbittorrent-nox
    pulsemixer
    sd
    tasksh
    taskopen
    nodePackages.tailwindcss
    tinygo
    taskwarrior-tui
    viu
    wezterm
    wget2
    wtype
    yt-dlp
    niv
  ];

  security.polkit.enable = true;

  virtualisation.docker.enable = true;
  virtualisation.docker.rootless.enable = true;
  services.atd.enable = true;
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    NIX_CURL_FLAGS = "-x socks://127.0.0.1:9050/";
  };
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  #hardware.nvidiaOptimus.disable = true;
  hardware.opengl.enable = true;
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  #system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

  nix = {
    # for the initial setup of flakes
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };
  fonts.fonts = with pkgs; [
    recursive
    vazir-fonts

    (nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];
  fonts = {
    fontconfig = {
      defaultFonts = {
        serif = ["recursive" "JetBrainsMono Nerd Font" "vazir"];
        sansSerif = ["recursive" "JetBrainsMono Nerd Font" "vazir"];
        monospace = ["recursive" "JetBrainsMono Nerd Font" "vazir"];
      };
    };
  };
}
