{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options = {
    rename.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.rename.enable {
    home.packages = with pkgs; [
      detox # to sanitize filenames
      vimv-rs
    ];
  };
}
