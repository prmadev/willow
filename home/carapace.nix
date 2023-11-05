{
  lib,
  config,
  ...
}:
with lib; {
  options.carapace.enable = mkEnableOption "carapace settings";
  config = mkIf config.carapace.enable {
    programs.carapace = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      enableZshIntegration = true;
    };
  };
}
