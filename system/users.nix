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
      "podman"
      "docker"
    ];
  };
  security.sudo = {
    enable = true;
    extraConfig = let
      timeout = "Defaults passwd_timeout=0";
      envkeep = "Defaults env_keep += \"ftp_proxy http_proxy https_proxy no_proxy\"";
      insults = "Defaults insults";
      feedback = "Defaults env_reset,pwfeedback";
    in
      builtins.concatStringsSep "\n" [timeout envkeep insults feedback];
  };
  security.doas = {
    enable = true;
  };
}
