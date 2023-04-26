{
  config,
  lib,
  ...
}:
with lib; {
  options.brootFile.enable = mkOption {
    type = types.bool;
    default = false;
  };
  config = mkIf config.brootFile.enable {
    programs.broot = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };
  };
}
