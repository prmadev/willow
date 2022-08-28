{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  imports = [
    ./communication.nix
    ./exercism.nix
    ./favo.nix
    ./graphical.nix
    ./hoard.nix
    ./task.nix
    ./newsboat.nix
    ./zk.nix
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
    favo.enable = true;
    graphical.enable = true;
    task.enable = true;
    hoard.enable = true;
    zk.enable = true;
    newsboat.enable = true;
  };
}
