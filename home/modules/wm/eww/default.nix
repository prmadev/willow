{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options = {
    eww.enable = mkOption {
      type = types.bool;
      default = true;
    };
  };
  config = mkIf config.eww.enable {
    home.packages = with pkgs; [
      luajit
      eww-wayland
    ];

    # configuration
    home.file.".config/eww/eww.scss".source = ./eww.scss;
    home.file.".config/eww/eww.yuck".source = ./eww.yuck;

    home.file.".config/eww/scripts/workspace" = {
      source = ./scripts/workspace;
      executable = true;
    };

    home.file.".config/eww/scripts/workspaces.lua" = {
      source = ./scripts/workspaces.lua;
      executable = true;
    };

    home.file.".config/eww/scripts/battery.sh" = {
      source = ./scripts/battery.sh;
      executable = true;
    };

    home.file.".config/eww/scripts/wifi.sh" = {
      source = ./scripts/wifi.sh;
      executable = true;
    };

    home.file.".config/eww/scripts/brightness.sh" = {
      source = ./scripts/brightness.sh;
      executable = true;
    };
  };
}
