{
  lib,
  config,
  ...
}:
with lib; {
  options.prompt.enable = mkEnableOption "prompt settings";

  config = mkIf config.prompt.enable {
    programs.starship.enable = true;
    #TODO customize it
  };
}
