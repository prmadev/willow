{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  options = {
    music.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf config.music.enable {
    services.mpd = {
      enable = true;
      musicDirectory = /home/a/Music;
      # network.startWhenNeeded = true;
      network.port = 6601;
    };
    programs.ncmpcpp = {
      package = pkgs.ncmpcpp.override {visualizerSupport = true;};
      enable = true;
    };

    home.packages = with pkgs; [
      termusic
    ];
  };
}
