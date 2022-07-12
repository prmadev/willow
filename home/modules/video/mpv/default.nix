{pkgs, ...}: {
  programs.mpv = {
    enable = true;
    package = pkgs.wrapMpv (pkgs.mpv-unwrapped.override {vapoursynthSupport = true;}) {youtubeSupport = true;};
    config = {
      ytdl-format = "bestvideo+bestaudio";
      profile = "gpu-hq";
      cache-default = 4000000;
    };
  };
}
