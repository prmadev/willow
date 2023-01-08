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
    programs.neovim = {
      enable = true;

      viAlias = true;

      vimAlias = true;
      withPython3 = true;
      withRuby = false;
      withNodeJs = true;
      extraLuaPackages = luaPkgs:
        with luaPkgs; [
          luacheck
        ];
      extraPackages = with pkgs; [
        pyright
        ccls
        gopls
        nodePackages.bash-language-server
        nodePackages.graphql-language-service-cli
        nodePackages.vscode-langservers-extracted

        # lsps
        sumneko-lua-language-server
        nil
        rust-analyzer
        actionlint
        luaformatter

        # null-ls sources
        selene
        alejandra
        black
        deadnix
        editorconfig-checker
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
        nodePackages.markdownlint-cli
        python3Packages.flake8
        shellcheck
        shellharden
        shfmt
        statix
        revive
        stylua
        vim-vint

        # DAP servers
        delve

        # Other stuff
        bc
      ];
      # extraConfig = "";
      # extraPython3Packages = pyPkgs: with pyPkgs; [python-language-server];
      plugins = with pkgs.vimPlugins; [
        {
          plugin = rose-pine;
          config = "";
        }
      ];
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
      pyright
      ccls
      gopls
      nodePackages.bash-language-server
      nodePackages.graphql-language-service-cli
      nodePackages.vscode-langservers-extracted

      # lsps
      sumneko-lua-language-server
      nil
      rust-analyzer
      actionlint
      luaformatter

      # null-ls sources
      selene
      alejandra
      black
      deadnix
      editorconfig-checker
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
      nodePackages.markdownlint-cli
      python3Packages.flake8
      shellcheck
      shellharden
      shfmt
      statix
      revive
      stylua
      vim-vint

      # DAP servers
      delve

      # Other stuff
      bc
    ];
  };
}
