{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    rust.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.rust.enable {
    home.packages = with pkgs; [
      rustup
    ];
  };
}
