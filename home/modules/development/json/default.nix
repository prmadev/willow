{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    json.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.json.enable {
    programs.jq.enable = true;
  };
}
