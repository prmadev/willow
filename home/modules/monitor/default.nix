{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    monitor.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.monitor.enable {
    programs.bottom.enable = true;
    programs.htop.enable = true;
    home.packages = with pkgs; [
      mprocs # not a monitoring tool
      procs
      bunnyfetch
      neofetch
      xorg.xwininfo
      duf
      du-dust
      ncdu_2
      dutree
      lsof
      nix-du
      nix-top
    ];
  };
}
