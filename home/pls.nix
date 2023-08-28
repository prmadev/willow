{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options.pls.enable = mkEnableOption "pls enable";

  config = mkIf config.pls.enable {
    programs.pls = {
      enable = true;
    };
  };
}
