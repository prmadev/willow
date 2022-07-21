{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    snippet.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.snippet.enable {
    programs.pet.enable = true; # TODO
  };
}
