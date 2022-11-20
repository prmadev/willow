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
    # NixVim
    programs.nixvim = {
      # enabling the whole thing
      enable = true;

      # color settings
      colorscheme = "rose-pine";

      # plugins to have
      extraPlugins = with pkgs.vimPlugins; [
        rose-pine
      ];
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
