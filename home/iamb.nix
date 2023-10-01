{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options.iamb.enable = mkEnableOption "iamb matrix settings";

  config = mkIf config.iamb.enable {
    home.packages = with pkgs;[
     iamb
    ];
  };
}
