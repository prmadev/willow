{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.typos.enable = mkEnableOption "typos settings";
  config = mkIf config.typos.enable {
    home.packages = with pkgs; [typos];
  };
}
