{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    prompt.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.prompt.enable {
    programs.starship.enable = true;
    #TODO customize it
  };
}
