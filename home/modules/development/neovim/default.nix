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
      enable = false;

      # --- color settings ---#
      colorscheme = "rose-pine";

      # --- plugins to have --- #
      extraPlugins = with pkgs.vimPlugins; [
        rose-pine
        rust-tools-nvim
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

        # notification
        notify = {
          enable = true;
        };

        # telescope
        telescope = {
          enable = true;
        };

        # file-tree
        nvim-tree = {
          enable = true;
          diagnostics.enable = true;
          git.enable = true;
          hijackNetrw = true;
          updateCwd = true;
          updateFocusedFile.enable = true;
          updateToBufDir.enable = true;
        };
        # terminal
        floaterm = {
          enable = true;
          autoInsert = true;
          shell = "${pkgs.zsh}/bin/zsh";
        };

        # gutter
        gitgutter = {
          enable = true;
        };

        # --- cmp
        nvim-cmp = {
          enable = true;
          snippet.expand = ''
            function(args)
               require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            end
          '';
        };
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
        nvim-autopairs.enable = true;
        undotree.enable = true;

        treesitter = {
          enable = true;
          nixGrammars = true;
        };

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

        # formatting
        null-ls = {
          enable = true;
          sources.formatting = {
            alejandra.enable = true;
            prettier.enable = true;
          };
        };

        # --- language speciifc
        # rust
        crates-nvim.enable = true;
        # nix
        nix.enable = true;
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
      neovim
      statix
      gitlint
      luajit
    ];
    home.sessionVariables = {
      NEOVIDE_MULTIGRID = true;
    };
  };
}
