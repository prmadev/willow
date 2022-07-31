{
  config,
  pkgs,
  lib,
  ...
}:
with lib; {
  options = {
    api.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.api.enable {
    home.packages = with pkgs; [
      postman
      insomnia
    ];
  };
}
