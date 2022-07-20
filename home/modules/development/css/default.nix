{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    css.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.css.enable {
    home.packages = with pkgs; [
      nodePackages.tailwindcss
      nodePackages.npm
      nodejs
      python3
    ];
  };
}
