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
      # --- enabling the whole thing --- #
      enable = true;

      # --- color settings ---#
      colorscheme = "rose-pine";

      # --- plugins to have --- #
      extraPlugins = with pkgs.vimPlugins; [
        rose-pine
      ];

      # --- plugins --- #
      plugins = {
        # ---  ui
        # tabs and buffers
        bufferline = {
          enable = true;
          diagnostics = "nvim_lsp";
        };

        # bottom status
        lualine = {
          enable = true;
        };

        floaterm = {
          enable = true;
          autoInsert = true;
          shell = "${pkgs.zsh}/bin/zsh";
        };

        gitgutter = {
          enable = true;
        };

        # --- cmp
        cmp-nvim-lsp.enable = true;
        cmp-dap.enable = true;
        cmp-nvim-lsp-document-symbol.enable = true;
        cmp-nvim-lsp-signature-help.enable = true;
        cmp-nvim-lua.enable = true;
        cmp-path.enable = true;
        cmp-treesitter.enable = true;
        cmp_luasnip.enable = true;

        # --- editing
        comment-nvim.enable = true;

        # lsp
        lsp = {
          enable = true;
          servers = {
            cssls.enable = true;
            gopls.enable = true;
            html.enable = true;
            jsonls.enable = true;
            rnix-lsp.enable = true;
            rust-analyzer.enable = true;
          };
        };

        # --- language speciifc
        # rust
        crates-nvim.enable = true;
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
