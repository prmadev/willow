{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
with lib; {
  options = {
    ragenix.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.ragenix.enable {
    home.packages = [
      inputs.ragenix.defaultPackage.x86_64-linux
      pkgs.age
    ];
  };
}
