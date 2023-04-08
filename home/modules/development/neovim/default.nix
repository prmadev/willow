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
      enable = false;
      package = pkgs.neovim;

      viAlias = true;

      vimAlias = true;
      withPython3 = true;
      withRuby = false;
      withNodeJs = true;
      # extraLuaPackages = luaPkgs:
      #   with luaPkgs; [
      #     luacheck
      #   ];
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
        lldb
        # null-ls sources
        selene
        alejandra
        black
        deadnix
        editorconfig-checker
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
        checkmake
        dotenv-linter
        # DAP servers
        hadolint
        delve
        mdl
        proselint
        sqlfluff
        vale
        yamllint
        cbfmt

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
      pyright
      ccls
      gopls
      nodePackages.bash-language-server
      nodePackages.graphql-language-service-cli
      nodePackages.vscode-langservers-extracted
      wget

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
      python310Packages.demjson3
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
      asciidoctor-with-extensions
      adrgen
      # Other stuff
      bc
      wget
    ];
  };
}
