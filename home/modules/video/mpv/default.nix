{pkgs, ...}: let
  color = import ../../colorscheme;
in {
  programs.mpv = {
    enable = true;
    package = pkgs.wrapMpv (pkgs.mpv-unwrapped.override {vapoursynthSupport = true;}) {youtubeSupport = true;};
    config = {
      ytdl-format = "bestvideo+bestaudio";
      background = color.rosepine.base;
      osd-color = color.rosepine.base;
      sub-color = color.rosepine.base;
      osd-border-color = color.rosepine.text;
      sub-border-color = color.rosepine.text;
      sub-font = "monospace";
      sub-scale = "0.5";
    };
  };
}
