{
  lib,
  config,
  ...
}:
with lib; {
  options.starship.enable = mkEnableOption "starship settings";

  config = mkIf config.starship.enable {
    programs.starship = {
      enable = true;
      enableNushellIntegration = false;
    };
    # TODO customize it
  };
}
