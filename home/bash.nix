{
  lib,
  config,
  ...
}:
with lib; {
  options.bash.enable = mkEnableOption "bash settings";

  config = mkIf config.bash.enable {
    programs.bash = {
      enable = true;
      enableCompletion = true;
      enableVteIntegration = true;
    };
    programs.starship.enableBashIntegration = true;
    programs.fzf.enableBashIntegration = mkIf config.fzf.enable true;
    programs.zoxide.enableBashIntegration = true;
    services.gpg-agent.enableBashIntegration = true;
  };
}
