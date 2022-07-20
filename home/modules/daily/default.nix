{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  imports = [
    ./task.nix
    ./communication.nix
    ./exercism.nix
    ./graphical.nix
  ];

  options = {
    daily.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf config.daily.enable {
    communication.enable = true;
    exercism.enable = true;
    graphical.enable = true;
    task.enable = true;
  };
}
