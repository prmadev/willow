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
    programs.nixvim = {
      enable = true;
      # colorscheme = "rose-pine";
      colorschemes = {
        gruvbox.enable = true;
        gruvbox.bold = true;
      };
    };

    home.packages = with pkgs; [
      wget
      luarocks
      sumneko-lua-language-server
      python310Packages.pip
      neovide
      plocate
      stylua
      selene
      statix
      gitlint
      luajit
    ];
    home.sessionVariables = {
      NEOVIDE_MULTIGRID = true;
    };
  };
}
