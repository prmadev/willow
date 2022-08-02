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
    home.packages = with pkgs; [
      ijq # interactive jq, written in go
      gojq # jq in go, implemented in go and can be used as a library
      dasel # supoorts more formats, is written in go
    ];
  };
}
