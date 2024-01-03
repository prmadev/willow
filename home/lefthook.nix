{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.lefthook.enable = mkEnableOption "lefthook settings";
  config = mkIf config.lefthook.enable {
    home.packages = with pkgs; [lefthook];
  };
}
