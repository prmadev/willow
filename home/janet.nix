{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.janet.enable = mkEnableOption "janet settings";
  config = mkIf config.janet.enable {
    home.packages = with pkgs; [
      janet
      jpm
    ];
  };
}
