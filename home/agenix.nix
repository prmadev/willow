{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
with lib; {
  options.ragenix.enable = mkEnableOption "agenix settings";

  config = mkIf config.ragenix.enable {
    home.packages = [
      inputs.ragenix.defaultPackage.x86_64-linux
      pkgs.age
    ];
  };
}
