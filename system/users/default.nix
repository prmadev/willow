_: {
  # users.defaultUserShell = pkgs.zsh;
  users.users.a = {
    createHome = true;
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "audio"
      "input"
      "systemd-journal"
      "lp"
      "networkmanager"
      "video" # for wayland light support
    ];
  };
}
