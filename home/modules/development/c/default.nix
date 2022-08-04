{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    c.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.c.enable {
    home.packages = with pkgs; [
      # gcc
      libgccjit
      cmake
    ];
  };
}
