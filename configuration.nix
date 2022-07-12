{
  config,
  pkgs,
  zk-nix,
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
    neovim #just in case I need it at system level
    curl # obvious
    zk-nix
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
  system.stateVersion = "22.11";

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
