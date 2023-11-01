{
  lib,
  config,
  ...
}:
with lib; {
  options.beet.enable = mkEnableOption "beet settings";
  config = mkIf config.beet.enable {
    programs.beets = {
      enable = true;
    };
  };
}
