{
  config,
  lib,
  ...
}:
with lib; {
  options.atuin.enable = mkEnableOption "atuin settings";

  config = mkIf config.atuin.enable {
    programs.atuin = {
      enable = true;

      enableNushellIntegration = config.nu.enable;
      enableZshIntegration = config.zsh.enable;
      enableFishIntegration = config.fish.enable;
      enableBashIntegration = config.bash.enable;
    };
  };
}
