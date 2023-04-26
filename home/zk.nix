{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options = {
    zk = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };
  config = mkIf config.zk.enable {
    home.sessionVariables = {
      ZK_NOTEBOOK_DIR = "$HOME/kapa/notes";
    };
    home.packages = with pkgs; [
      zk
    ];
  };
}
