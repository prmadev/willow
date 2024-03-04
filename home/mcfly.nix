{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.mcfly.enable = mkEnableOption "mcfly settings";
  config = mkIf config.mcfly.enable {
    programs.mcfly = {
      enable = true;
      # fzf.enable = true; // TODO: enable after update
    };
  };
}
