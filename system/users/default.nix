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
  security.sudo = {
    enable = true;
    extraConfig = let
      timeout = "Defaults passwd_timeout=0";
      envkeep = "Defaults env_keep += \"ftp_proxy http_proxy https_proxy no_proxy\"";
      insults = "Defaults insults";
      break = "\n";
      feedback = "Defaults env_reset,pwfeedback";
    in
      timeout + break + envkeep + break + insults + break + feedback;
  };
  security.doas = {
    enable = true;
  };
}
