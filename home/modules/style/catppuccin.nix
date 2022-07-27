{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  imports = [./mocha.nix];
}
