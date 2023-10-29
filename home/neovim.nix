{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.neovim.enable = mkEnableOption "neovim settings";

  config = mkIf config.neovim.enable {
    programs.nixvim = {
      enable = true;
      colorschemes.catppuccin = {
        enable = true;
        flavour = "macchiato";
        terminalColors = true;
        showBufferEnd = true;
      };
      plugins = {
        bufferline = {
          enable = true;
          diagnostics = "nvim_lsp";
        };
        cmp_luasnip.enable = true;
        cmp-path.enable = true;
        cmp-treesitter.enable = true;
        nvim-cmp = {
          enable = true;
          sources = [
            {name = "nvim_lsp";}
            {name = "path";}
            {name = "luasnip";}
          ];
          mappingPresets = ["insert"];
          mapping = {
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<Tab>" = "cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select })";
          };
          formatting.fields = ["kind" "abbr" "menu"];
          snippet.expand = "luasnip";
        };
        nvim-tree = {
          enable = true;
        };
        fugitive = {
          enable = true;
        };
        diffview = {
          enable = true;
        };
        gitblame = {
          enable = false;
        };
        gitgutter = {
          enable = true;
        };
        gitsigns = {
          enable = true;
        };
        rust-tools = {
          enable = true;
        };
        zig.enable = true;
        treesitter = {
          enable = true;
          nixGrammars = true;
          indent = true;
          incrementalSelection.enable = true;

          nixvimInjections = true;

          moduleConfig.highlight = {
            additional_vim_regex_highlighting = ["org"];
            enable = true;
            disable = ["pug"];
          };
        };
        ts-autotag = {
          enable = true;
        };
        ts-context-commentstring = {
          enable = true;
        };
        treesitter-refactor = {
          enable = true;
        };
        rainbow-delimiters = {
          enable = true;
        };
        treesitter-context = {
          enable = false;
        };
        lsp = {
          enable = true;
          servers = {
            bashls.enable = true;
            cssls.enable = true;
            efm.enable = true;
            html.enable = true;
            jsonls.enable = true;
            lua-ls.enable = true;
            rust-analyzer = {
              enable = true;
              settings = {
                checkOnSave = true;
                check.command = "clippy";
              };
            };
            gopls.enable = true;
            zls.enable = true;
            nil_ls = {
              enable = true;
              settings = {
                formatting.command = ["${pkgs.alejandra}/bin/bin" "--quiet"];
              };
            };
            nixd.enable = true;
            yamlls.enable = true;
          };

          onAttach = ''
            vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
          '';
          keymaps = {
            diagnostic = {
              "<leader>k" = "goto_prev";
              "<leader>j" = "goto_next";
            };
            lspBuf = {
              "gd" = "definition";
              "gD" = "references";
              "gt" = "type_definition";
              "gi" = "implementation";
              "K" = "hover";
              "<leader>k" = "hover";
              "<leader>r" = "rename";
            };
          };
        };
        fidget = {
          enable = true;
        };
        lsp-format = {
          enable = true;
          setup = {
            # gopls = {
            #   order = ["gopls" "efm"];
            #   sync = true;
            #   force = true;
            # };
            nil_ls = {
              sync = true;
              force = true;
            };
          };
        };

        nvim-lightbulb = {
          enable = false;
        };
        trouble = {
          enable = true;
        };

        lsp-lines = {
          enable = false;
        };

        none-ls = {
          enable = true;

          sources = {
            code_actions = {
              # gitsigns.enable = true;
              shellcheck.enable = true;
            };
            diagnostics = {
              deadnix.enable = true;
              gitlint.enable = true;
              luacheck.enable = true;
              protolint.enable = true;
              shellcheck.enable = true;
            };
            formatting = {
              alejandra.enable = true;
              gofmt.enable = true;
              jq.enable = true;
              markdownlint.enable = true;
              prettier_d_slim.enable = true;
              protolint.enable = true;
              rustfmt.enable = true;
              sqlfluff.enable = true;
              shfmt.enable = true;
              stylua.enable = true;
              taplo.enable = true;
            };
          };
        };
        luasnip = {
          enable = true;
        };
        telescope = {
          enable = true;
          keymapsSilent = true;
          keymaps = {
            "<leader>/" = "live_grep";
            "<leader>f" = "find_files";
            "<leader>b" = "buffers";
            "<leader>d" = "diagnostics";
            "<C-p>" = {
              action = "git_files";
              desc = "Telescope Git Files";
            };
          };
          extensions = {
            file_browser = {
              enable = true;
            };
            undo.enable = true;
          };
        };

        comment-nvim = {
          enable = true;

          toggler = {line = "<C-c>";};
        };
        noice = {
          enable = false;
        };

        floaterm = {
          enable = true;
          shell = "fish";
          wintype = "float";
          keymaps.toggle = "<leader>\\";
        };
        lualine = {
          enable = true;
        };
        nix.enable = true;
        indent-blankline.enable = true;
        nix-develop = {
          enable = true;
        };
        notify = {
          enable = true;
        };
        nvim-bqf = {
          enable = true;
        };

        undotree.enable = true;
        surround.enable = true;
        nvim-autopairs.enable = true;

        lspsaga = {
          enable = true;
          lightbulb.sign = false;
        };
        lspkind = {
          enable = true;
          mode = "symbol_text";
          cmp.ellipsisChar = "…";
          cmp.menu = {
            buffer = "[Buffer]";
            nvim_lsp = "[LSP]";
            luasnip = "[LuaSnip]";
            nvim_lua = "[Lua]";
            latex_symbols = "[Latex]";
          };
          cmp.after = ''
            function(entry, vim_item, kind)
              local strings = vim.split(kind.kind, "%s", { trimempty = true })
              if #strings == 2 then
                kind.kind = " " .. strings[1] .. " "
                kind.menu = "   " .. strings[2]
              end

              return kind
            end
          '';
        };

        nvim-colorizer = {
          enable = true;
        };
        which-key = {
          enable = true;
        };
      };

      options = {
        number = true;
        relativenumber = true;
        shiftwidth = 2;
        tabstop = 2;
        smartindent = true;
        expandtab = true;
        smartcase = true;
        undodir = "/home/a/.cache/nvim/undodir";
        undofile = true;
        clipboard = "unnamedplus";
      };

      globals = {
        mapleader = " ";
        maplocalleader = " ";
      };
      keymaps = [
        {
          key = "<leader>e";
          action = "<CMD>NvimTreeToggle<CR>";
          mode = "n";
        }
        {
          key = "<leader>a";
          action = "<CMD>Lspsaga code_action<CR>";
          mode = "n";
        }
        {
          key = "<leader>a";
          action = "<CMD>Lspsaga code_action<CR>";
          mode = "n";
        }

        {
          key = "<leader>xx";
          action = "<cmd>TroubleToggle<cr>";
          mode = "n";
        }
        {
          key = "<leader>xw";
          action = "<cmd>TroubleToggle workspace_diagnostics<cr>";
          mode = "n";
        }
        {
          key = "<leader>xd";
          action = "<cmd>TroubleToggle document_diagnostics<cr>";
          mode = "n";
        }
        {
          key = "<leader>xq";
          action = "<cmd>TroubleToggle quickfix<cr>";
          mode = "n";
        }
        {
          key = "<leader>xl";
          action = "<cmd>TroubleToggle loclist<cr>";
          mode = "n";
        }
        {
          key = "gR";
          action = "<cmd>TroubleToggle lsp_references<cr>";
          mode = "n";
        }
      ];
    };
    programs.neovim = {
      enable = false;
      # package = pkgs.neovim-nightly;

      viAlias = true;

      vimAlias = true;
      withPython3 = false;
      withRuby = false;
      withNodeJs = false;
      extraLuaPackages = luaPkgs:
        with luaPkgs; [
          luacheck
        ];
      extraPackages = with pkgs; [
        # pyright
        # ccls
        gopls
        # nodePackages.bash-language-server
        # nodePackages.graphql-language-service-cli
        nodePackages.vscode-langservers-extracted

        # tree-sitter
        # lsps
        sumneko-lua-language-server
        nil
        rust-analyzer
        # actionlint
        luaformatter
        lldb
        # null-ls sources
        # selene
        alejandra
        # black
        deadnix
        # editorconfig-checker
        gofumpt
        gotools
        golangci-lint
        taplo
        gotests
        iferr
        delve
        gotestsum
        impl
        revive
        reftools
        gomodifytags
        go-swag
        gitlint
        # mypy
        # nodePackages.alex
        # nodePackages.prettier
        # nodePackages.markdownlint-cli
        # python3Packages.flake8
        # shellcheck
        # shellharden
        # shfmt
        statix
        revive
        stylua
        # vim-vint
        checkmake
        dotenv-linter
        # DAP servers
        # hadolint
        delve
        mdl
        proselint
        # sqlfluff
        vale
        yamllint
        # cbfmt

        # Other stuff
        bc
      ];
      # extraConfig = "";
      # extraPython3Packages = pyPkgs: with pyPkgs; [python-language-server];
    };
    # xdg.configFile = {
    #   "nvim/init.lua".source = ./init.lua;
    #   "nvim/lua".source = ./lua;
    #   "nvim/parser".source = "${parserDir}";
    # };

    # xdg.dataFile =
    #   {
    #     "nvim/vscode-lldb".source = "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb";
    #   }
    #   // (with lib;
    #     mapAttrs' (n: v:
    #       nameValuePair "nvim/plugins/${n}" {
    #         source = "${v}";
    #       })
    #     plugins);

    home.packages = with pkgs; [
      # pyright
      # ccls
      gopls
      nodePackages.bash-language-server
      # nodePackages.graphql-language-service-cli
      nodePackages.vscode-langservers-extracted
      wget

      # lsps
      sumneko-lua-language-server
      nil
      # rust-analyzer
      # actionlint
      luaformatter

      # null-ls sources
      # selene
      alejandra
      # black
      deadnix
      # editorconfig-checker
      gofumpt
      gotools
      gotests
      iferr
      delve
      gotestsum
      impl
      revive
      reftools
      gomodifytags
      go-swag
      gitlint
      mypy
      nodePackages.alex
      nodePackages.prettier
      # nodePackages.markdownlint-cli
      # python3Packages.flake8
      # python310Packages.demjson3
      shellcheck
      luarocks
      shellharden
      shfmt
      statix
      revive
      stylua
      vim-vint
      taplo
      # DAP servers
      delve
      # asciidoctor-with-extensions
      adrgen
      # Other stuff
      bc
      # wget
    ];
  };
}
