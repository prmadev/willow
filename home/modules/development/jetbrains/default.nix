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
  };
}
