{
  pkgs,
  lib,
  config,
  inputs,
  ...
} @ args:
with lib; {
  options = {
    efm.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.efm.enable {
    home.packages = with pkgs; [
      efm-langserver
    ];

    home.file = {
      ".config/efm-langserver/config.yaml" = {
        source = ./config.yaml;
      };
    };
  };
}
