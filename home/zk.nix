{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options.zk.enable = mkEnableOption "zk settings";

  config = mkIf config.zk.enable {
    home.sessionVariables.ZK_NOTEBOOK_DIR = "$HOME/kapa/notes";

    home.packages = with pkgs; [
      zk
    ];
  };
}
