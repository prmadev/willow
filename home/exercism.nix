{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    exercism = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = mkIf config.exercism.enable {
    home.packages = with pkgs; [
      exercism
    ];
  };
}
