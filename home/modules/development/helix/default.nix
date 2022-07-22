{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    helix.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.helix.enable {
    programs.helix = {
      enable = true;
    };
  };
}
