{pkgs, ...}: let
  color = import ../../colorscheme;
in {
  programs.mpv = {
    enable = true;
    package = pkgs.wrapMpv (pkgs.mpv-unwrapped.override {vapoursynthSupport = true;}) {youtubeSupport = true;};
    config = {
      ytdl-format = "bestvideo+bestaudio";
      # profile = color.rose;
      # cache-default = 4000000;
      #TODO on colors
    };
  };
}
