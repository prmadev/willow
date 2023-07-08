{
  lib,
  config,
  ...
}:
with lib; {
  options.pueue.enable = mkEnableOption "pueue background jobs";

  config = mkIf config.pueue.enable {
    programs.pueue = {
      enable = true;
    };
  };
}
