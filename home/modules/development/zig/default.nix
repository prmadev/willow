{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    zig.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.zig.enable {
    home.packages = with pkgs; [
      zig
    ];
  };
}
