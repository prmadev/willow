{pkgs, ...}: {
  #
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
}
