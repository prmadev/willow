{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    neovim.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.neovim.enable {
    home.packages = with pkgs; [
      wget
      luarocks
      python310Packages.pip
    ];
  };
}
