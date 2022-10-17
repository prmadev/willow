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
      sumneko-lua-language-server
      python310Packages.pip
      neovide
      plocate
    ];
  };
}
