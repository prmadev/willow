{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options = {
    clifm.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.clifm.enable {
    home.packages = with pkgs; [
      clifm
    ];
    fzf.enable = true;
  };
}
