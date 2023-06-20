{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.zig.enable = mkEnableOption "zig settings";

  config = mkIf config.zig.enable {
    home.packages = with pkgs; [
      zig
      zls
    ];
  };
}
