{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  imports = [
    ./syncthing
    ./communication.nix
    ./exercism.nix
    ./favo.nix
    ./graphical.nix
    ./hoard.nix
    ./task.nix
    ./newsboat.nix
    ./zk.nix
    ./music.nix
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
    task.enable = false;
    hoard.enable = false;
    zk.enable = true;
    newsboat.enable = false;
    syncthing.enable = true;
    music.enable = true;
    home.packages = with pkgs; [
      calibre
      mprocs # not a monitoring tool
      zola
      zk
      # libresprite
      # aseprite-unfree
      d2
    ];
  };
}
