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
        background = config.cat.mocha.base.hex;
        osd-color = config.cat.mocha.base.hex;
        sub-color = config.cat.mocha.base.hex;
        osd-border-color = config.cat.mocha.text.hex;
        sub-border-color = config.cat.mocha.text.hex;
        sub-font = "monospace";
        sub-scale = "0.5";
      };
    };
  };
}
