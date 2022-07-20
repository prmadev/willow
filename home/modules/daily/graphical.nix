{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    graphical = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = mkIf config.graphical.enable {
    home.packages = with pkgs; [
      inkscape
      gimp
      pastel
      imagemagick
      imv
      viu
      ffmpeg_5-full
    ];
  };
}
