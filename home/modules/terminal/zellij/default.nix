{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options = {
    zellij.enable =
      mkOption {
      };
  };
  config = mkIf config.zellij.enable {
    programs.zellij = {
		enable = true;
    };
  };
}
