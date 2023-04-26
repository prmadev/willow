{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    storage.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.storage.enable {
    home.packages = with pkgs; [
      gparted
    ];
  };
}
