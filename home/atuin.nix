{
  config,
  lib,
  ...
}:
with lib; {
  options.atuin.enable = mkEnableOption "atuin settings";

  config = mkIf config.atuin.enable {
    programs.atuin = {
      # enable = true;
      # enableNushellIntegration = true;
      # enableZshIntegration = true;
      # enableFishIntegration = true;
      # enableBashIntegration = true;
    };
  };
}
