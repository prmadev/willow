{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.rust-rover.enable = mkEnableOption " rust-rover settings";
  config = mkIf config.rust-rover.enable {
    #
    home.packages = with pkgs; [
      jetbrains.rust-rover

      linuxPackages_latest.perf
    ];
  };
}
