{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  imports = [./bw.nix ./gpg.nix ./agenix.nix];
  options = {
    security.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.security.enable {
    bw.enable = true;
    gpg.enable = true;
    ragenix.enable = true;
  };
}
