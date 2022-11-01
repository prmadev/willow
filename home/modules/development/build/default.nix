{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    build.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.build.enable {
    home.packages = with pkgs; [
      gnumake
    ];
  };
}
