{
  lib,
  pkgs,
  config,
  ...
}:
with lib; {
  options.skim.enable = mkEnableOption "skim settings";
  config = mkIf config.skim.enable {
    programs.skim = {
      enable = true;
      enableZshIntegration = config.zsh.enable;
      enableFishIntegration = config.fish.enable;
      enableBashIntegration = config.bash.enable;
    };
    home.packages = with pkgs; [fd];
  };
}
