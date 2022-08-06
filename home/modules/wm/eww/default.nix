{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.eww;
in {
  options.eww = {enable = mkEnableOption "eww";};

  config = mkIf cfg.enable {
    # theres no programs.eww.enable here because eww looks for files in .config
    # thats why we have all the home.files

    # eww package
    home.packages = with pkgs; [
      eww-wayland
      libnotify
    ];

    # configuration
    home.file.".config/eww/eww.scss".source = ./eww.scss;
    home.file.".config/eww/eww.yuck".source = ./eww.yuck;
  };
}
