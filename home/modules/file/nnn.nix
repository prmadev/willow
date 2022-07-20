{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    nnn.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.nnn.enable {
    programs.nnn = {
      enable = true;
      package = pkgs.nnn.override {withNerdIcons = true;};
      bookmarks = {
        d = "~/Downloads";
        p = "~/Documents/projects";
        g = "~/Videos/golearn/";
      };
      extraPackages = with pkgs; [
        ffmpegthumbnailer
        mediainfo
      ];
      plugins = {
        src = inputs.nnn-plugins + "/plugins";
      };
    };
  };
}
