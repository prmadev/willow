{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.element.enable = mkEnableOption "element settings";
  config = mkIf config.element.enable {
    home.packages = with pkgs; [element-desktop];
  };
}
