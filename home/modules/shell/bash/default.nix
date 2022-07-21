{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    bash.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.bash.enable {
    programs.bash = {
      enable = true;
      enableVteIntegration = true;
    };
    programs.starship.enableBashIntegration = true;
    programs.fzf.enableBashIntegration = true;
    programs.zoxide.enableBashIntegration = true;
    programs.nix-index.enableBashIntegration = true;
    services.gpg-agent.enableBashIntegration = true;
  };
}
