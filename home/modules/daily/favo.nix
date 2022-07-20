{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options = {
    favo = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };
  config = mkIf config.favo.enable {
    home.sessionVariables = {
      FAVO_BOOKMARK = "$ZK_NOTEBOOK_DIR/bm.md";
    };
  };
}
