{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    android.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.android.enable {
    home.packages = with pkgs; [
      android-file-transfer
    ];
  };
}
