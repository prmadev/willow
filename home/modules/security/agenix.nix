{ pkgs
, lib
, config
, inputs
, ...
}:
with lib; {
  options = {
    agenix.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config =mkIf config.agenix.enable {
    home.packages = [
      inputs.agenix.defaultPackage.x86_64-linux
    ];
  };
}
