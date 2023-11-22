{
  lib,
  config,
  ...
}:
with lib; {
  options.cliphist.enable = mkEnableOption "cliphist settings";
  config = mkIf config.cliphist.enable {
    servicess.cliphist = {
      enable = true;
    };
  };
}
