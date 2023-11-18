{
  lib,
  config,
  ...
}:
with lib; {
  options.gpg.enable = mkEnableOption "gpg settings";

  config = mkIf config.gpg.enable {
    programs.gpg = {
      enable = true;
    };

    services.gpg-agent = {
      enable = true;
      enableSshSupport = false;
      pinentryFlavor = "gtk2";
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      enableExtraSocket = true;
      defaultCacheTtl = 14400;
      defaultCacheTtlSsh = 14400;
      maxCacheTtl = 14400;
      maxCacheTtlSsh = 14400;
      sshKeys = [
        # "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEUYZWlY3NrgLHeDCChXIm2Wu/cQAIg7dB0WNsD0yRQa a@nixer"
        # "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEUYZWlY3NrgLHeDCChXIm2Wu/cQAIg7dB0WNsD0yRQa a@nixer"
        # "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDJRc7ke7Io8zQWOkmrJrq1gviaCUQL/GCLJnHTem4v7O1C4ct6ngdcIY/GQp6VWPQmlPVFvlvsqTDvKtkM0LM5jzn6Iwu0si9f7zc+pOvock4gpP2J9jiFgwBCwTpYsN19mS/UdrBeST3aZ8pR5M5yuGlTbJIJzOw2rQ0Go6U6XTQjS19zabZ9XFwGMAcKZiuqtE0tVyYD5eakOrHRvad7nwDhwegp9xg+UHQjxITgYGcR6NsWhkQJUUALPSKaS8AbT8iBKPTCbdZCxDNbhxTUTKbKjIYPCoETqOBcYLFRrrTTKB74o2qiMbKeRDIkJqMGmZbStpoAIqVsGMuUGTCrZSG6H2nuRVCXfWQ1GMXvP7bUDXbf2xBTvExSdaWOgE7VKQEdfxOtNk/3ZMc65oW+dk60nzfvAmX8jzFEy+03OlUX4w3kT8pFDeZxwFeFvaAeqb+SFXC1epnjlqLlxkwX7+Z9KxOq4HeLRX3HgBcfC/RHz34R7AwKAxK2dDN3gCc= a@nixer"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMBdfp2WO8FIN6dYb+fCUpJRmu2+bhI8kfrgVcdI5PRn prma.dev@protonmail.com"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP/Qdsf9sOhwqeeBnVxLYR39zBkMgVnw5k8ry6hOX0zJ me@prma.dev"
      ];
    };
  };
}
