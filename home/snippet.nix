{
  lib,
  config,
  ...
}:
with lib; {
  options.pet.enable = mkEnableOption "pet settings";
  config = mkIf config.pet.enable {
    programs.pet.enable = true; # TODO
  };
}
