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
        background = config.colors.macchiato.base.hex;
        osd-color = config.colors.macchiato.base.hex;
        sub-color = config.colors.macchiato.base.hex;
        osd-border-color = config.colors.macchiato.text.hex;
        sub-border-color = config.colors.macchiato.text.hex;
        sub-font = "monospace";
        sub-scale = "0.5";
      };
    };
  };
}
