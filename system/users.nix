_: {
  # users.defaultUserShell = pkgs.zsh;
  users.users.a = {
    createHome = true;
    name = "a";
    isNormalUser = true;
    initialHashedPassword = "$y$j9T$DObab.uS2RGdfjd6F9ZXu/$iA0K./y1rkZdPuUvN6sSfCmbUuedEn5QK8UV6.9jMC.";
    openssh.authorizedKeys = {
      keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEUYZWlY3NrgLHeDCChXIm2Wu/cQAIg7dB0WNsD0yRQa a@nixer"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEUYZWlY3NrgLHeDCChXIm2Wu/cQAIg7dB0WNsD0yRQa a@nixer"
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDJRc7ke7Io8zQWOkmrJrq1gviaCUQL/GCLJnHTem4v7O1C4ct6ngdcIY/GQp6VWPQmlPVFvlvsqTDvKtkM0LM5jzn6Iwu0si9f7zc+pOvock4gpP2J9jiFgwBCwTpYsN19mS/UdrBeST3aZ8pR5M5yuGlTbJIJzOw2rQ0Go6U6XTQjS19zabZ9XFwGMAcKZiuqtE0tVyYD5eakOrHRvad7nwDhwegp9xg+UHQjxITgYGcR6NsWhkQJUUALPSKaS8AbT8iBKPTCbdZCxDNbhxTUTKbKjIYPCoETqOBcYLFRrrTTKB74o2qiMbKeRDIkJqMGmZbStpoAIqVsGMuUGTCrZSG6H2nuRVCXfWQ1GMXvP7bUDXbf2xBTvExSdaWOgE7VKQEdfxOtNk/3ZMc65oW+dk60nzfvAmX8jzFEy+03OlUX4w3kT8pFDeZxwFeFvaAeqb+SFXC1epnjlqLlxkwX7+Z9KxOq4HeLRX3HgBcfC/RHz34R7AwKAxK2dDN3gCc= a@nixer"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMBdfp2WO8FIN6dYb+fCUpJRmu2+bhI8kfrgVcdI5PRn prma.dev@protonmail.com"
      ];
    };
    home = "/home/a";
    hashedPassword = "$y$j9T$DObab.uS2RGdfjd6F9ZXu/$iA0K./y1rkZdPuUvN6sSfCmbUuedEn5QK8UV6.9jMC.";

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
    # extraConfig = let
    #   timeout = "Defaults passwd_timeout=0";
    #   envkeep = "Defaults env_keep += \"ftp_proxy http_proxy https_proxy no_proxy\"";
    #   insults = "Defaults insults";
    #   feedback = "Defaults env_reset,pwfeedback";
    # in
    #   builtins.concatStringsSep "\n" [timeout envkeep insults feedback];
  };
  security.doas = {
    enable = true;
  };
}
