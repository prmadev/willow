{
  config,
  lib,
  ...
}:
with lib; {
  options.brootFile.enable = mkEnableOption "broot settings";

  config = mkIf config.brootFile.enable {
    programs.broot = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };
  };
}
