{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options.mpv.enable = mkEnableOption "mpv settings";

  config = mkIf config.mpv.enable {
    programs.mpv = {
      enable = true;
      package = pkgs.wrapMpv (pkgs.mpv-unwrapped.override {vapoursynthSupport = true;}) {youtubeSupport = true;};
      config = {
        ytdl-format = "bestvideo+bestaudio";
        background = config.colors.moon.base.hex;
        osd-color = config.colors.moon.base.hex;
        sub-color = config.colors.moon.base.hex;
        osd-border-color = config.colors.moon.text.hex;
        sub-border-color = config.colors.moon.text.hex;
        sub-font = "monospace";
        sub-scale = "0.5";
      };
    };
  };
}
