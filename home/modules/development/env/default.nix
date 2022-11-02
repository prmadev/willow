{
  lib,
  config,
  ...
}:
with lib; {
  options = {
    env.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf config.env.enable {
    programs.direnv = {
      enable = true;
      enableBashIntegration = mkIf config.bash.enable true;
      enableZshIntegration = mkIf config.zsh.enable true;
      # enableFishIntegration = mkIf config.fish.enable true;
      nix-direnv.enable = true;
    };
  };
}
