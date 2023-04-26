{
  lib,
  config,
  ...
}:
with lib; {
  options = {
    doc.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.doc.enable {
    programs = {
      info.enable = true;
      tealdeer.enable = true;
      # man.generateCaches = true;
    };
  };
}
