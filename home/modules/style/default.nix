{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  imports = [./colors.nix ./gtkconf.nix ./font.nix];

  options = {
    style.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.style.enable {
    font.enable = true;
    gtkconf.enable = true;
  };
}