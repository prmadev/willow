{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    compression.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.compression.enable {
    home.packages = with pkgs; [
      p7zip # needed for 7z files
      zip
      unzip
      rar
      pigz
      atool
    ];
  };
}
