{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.precommit.enable = mkEnableOption "precommit settings";
  config = mkIf config.precommit.enable {
    home.packages = with pkgs; [pre-commit];
  };
}
