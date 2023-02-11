{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  imports = [./global-fonts.nix ./colors.nix ./font.nix];

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
