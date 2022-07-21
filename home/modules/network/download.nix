{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    download.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.download.enable {
    programs.aria2 = {
      enable = true;
      settings = {
        max-connection-per-server = 16;
        max-concurrent-downloads = 16;
        continue = true;
      };
    };
    home.packages = with pkgs; [
      qbittorrent-nox
      wget2
      yt-dlp
    ];
  };
}
