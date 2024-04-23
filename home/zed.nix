{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.zed.enable = mkEnableOption "zed settings";
  config = mkIf config.zed.enable {
    home.packages = with pkgs; [zed-editor];
  };
}
