{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options = {
    goland.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.goland.enable {
    home.packages = with pkgs; [
      jetbrains.goland
    ];

    home.sessionVariables = {
      _JAVA_AWT_WM_NONREPARENTING = 1;
    };
  };
}
