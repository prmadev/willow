{pkgs, ...}: {
  programs.aria2 = {
    enable = true;
    settings = {
      max-connection-per-server = 16;
      max-concurrent-downloads = 16;
      continue = true;
    };
  };
  programs.ssh.enable = true;
  home.packages = with pkgs; [
    qbittorrent-nox
    wget2
    yt-dlp
    clash # for networking #TODO
  ];
  home.file = {
    ".config/clash/config.yaml" = {
      source = ./config.yaml;
    };
  };

  systemd.user.services.clash = {
    Unit = {
      Description = "Clash daemon, A rule-based proxy in Go.";
      After = "network.target";
    };

    Service = {
      Type = "simple";
      Restart = "always";
      ExecStart = "{pkgs.clash}/bin/clash";
    };
    Install = {
      WantedBy = ["multi-user.target"];
    };
  };
}
