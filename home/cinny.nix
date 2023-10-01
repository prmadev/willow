{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options.cinny.enable = mkEnableOption "cinny matrix settings";

  config = mkIf config.cinny.enable {
    home.packages = with pkgs;[
      cinny-desktop
    ];
  };
}
