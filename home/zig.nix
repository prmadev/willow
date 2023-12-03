{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
with lib; {
  options.zig.enable = mkEnableOption "zig settings";

  config = mkIf config.zig.enable {
    home.packages = [
      pkgs.zigpkg
      # pkgs.zls
      inputs.zls.packages.x86_64-linux.zls
    ];
  };
}
