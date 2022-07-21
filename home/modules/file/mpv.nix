{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options = {
    mpv.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.mpv.enable {
    programs.mpv = {
      enable = true;
      package = pkgs.wrapMpv (pkgs.mpv-unwrapped.override {vapoursynthSupport = true;}) {youtubeSupport = true;};
      config = {
        ytdl-format = "bestvideo+bestaudio";
        background = config.colors.base.hex;
        osd-color = config.colors.base.hex;
        sub-color = config.colors.base.hex;
        osd-border-color = config.colors.text.hex;
        sub-border-color = config.colors.text.hex;
        sub-font = "monospace";
        sub-scale = "0.5";
      };
    };
  };
}
