{
  lib,
  pkgs,
  config,
  ...
}:
with lib; {
  options.skim.enable = mkEnableOption "skim settings";
  config = mkIf config.skim.enable {
    programs.skim.enable = true;
    home.packages = with pkgs; [fd];
  };
}
