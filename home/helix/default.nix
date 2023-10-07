{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  imports = [./rosepine.nix ./catppuccin-improved.nix];

  options.helix.enable = mkEnableOption "helix settings";

  config = mkIf config.helix.enable {
    programs.helix = {
      enable = true;
      defaultEditor = true;

      package = config.editor.helix.package;

      languages = {
        language-server = {
          gopls = {
            command = "gopls";
            config = {
              hints = {
                assignVariableTypes = true;
                compositeLiteralFields = true;
                constantValues = true;
                functionTypeParameters = true;
                parameterNames = true;
                rangeVariableTypes = true;
              };
              gofumpt = true;

              staticcheck = false;

              analyses = {
                nilness = true;
                shadow = true;
                unusedwrite = true;
                unusedparams = true;
                useany = true;
                unusedvariable = true;
              };

              vulncheck = "Imports";
              semanticTokens = true;
            };
          };
          nil = {
            command = "nil";

            config.nil = {
              formatting.command = ["alejandra" "--quiet"];
              nix.flake = {
                # autoEvalInputs = true;
              };
            };
          };

          hls = mkIf config.haskell.enable {
            command = "haskell-language-server-wrapper";
            # args = ["--lsp"];
            config = {
              hling.config.flags = [
                "--all"
              ];
              rename.config.crossModule = true;
            };
          };
          rustanalyzer = {
            command = "rust-analyzer";
            config = {
              check.command = "clippy";
              inlayHints.bindingModeHints.enable = false;
              inlayHints.closingBraceHints.minLines = 10;
              inlayHints.closureReturnTypeHints.enable = "with_block";
              inlayHints.discriminantHints.enable = "fieldless";
              inlayHints.lifetimeElisionHints.enable = "skip_trivial";
              inlayHints.typeHints.hideClosureInitialization = false;
            };
          };
        };
        language = [
          {
            name = "haskell";
            roots = ["Setup.hs" "stack.yaml" "cabal.project" "*.cabal" "hie.yaml"];
            auto-format = true;
            language-servers = ["hls"];
          }
          {
            name = "nix";
            auto-format = true;
            formatter = {
              command = "alejandra";
              args = ["--quiet"];
            };

            language-servers = ["nil"];
          }

          {
            name = "go";
            auto-format = true;
            formatter.command = "gofumpt";
          }
        ];
      };

      settings = {
        theme = "veganMacchiato";
        editor = {
          shell = ["zsh" "-c"];
          # auto-format = true; # default is true

          # auto completion
          idle-timeout = 0;
          completion-trigger-len = 1;

          # ui
          line-number = "relative";
          color-modes = true;
          cursorline = true;
          cursorcolumn = true;
          bufferline = "always";
          indent-guides = {
            render = true;
            character = "│";
          };

          cursor-shape = {
            insert = "bar";
            # normal = "block"; # default is block
            # select = "block"; # default is block
          };

          statusline = {
            left = ["mode" "spacer" "diagnostics"];
            center = ["file-name" "file-modification-indicator" "version-control"];
            right = ["workspace-diagnostics" "spacer" "spinner" "spacer" "position-percentage" "spacer" "total-line-numbers"];
          };

          # lsp
          lsp.display-messages = true;
          lsp.display-inlay-hints = true;
          lsp.display-signature-help-docs = false;

          # tools
          auto-pairs = true;
          file-picker.hidden = true;
          file-picker.git-ignore = true;
        };

        keys = {
          normal = {
            "S-right" = ":buffer-next";
            "S-left" = ":buffer-previous";
            "S-L" = ":buffer-next";
            "S-H" = ":buffer-previous";
            # ret = ["open_below" "normal_mode"];
            "C-f" = [":new" ":insert-output lf-pick" ":theme default" "select_all" "split_selection_on_newline" "goto_file" "goto_last_modified_file" ":buffer-close!" ":theme veganMacchiato"];
            X = ["extend_line_above"];
            space = {
              c = ":bc";
              R = [":primary-clipboard-paste-replace"];
            };
            # y = [":clipboard-yank-join"];
            # p = [":clipboard-paste-after"];
            # P = [":clipboard-paste-before"];
            # d = [":clipboard-yank-join" "delete_selection"];
            pageup = "no_op";
            pagedown = "no_op";
          };

          select = {
            "S-right" = ":buffer-next";
            "S-left" = ":buffer-previous";
            # y = [":clipboard-yank-join"];
            pageup = "no_op";
            pagedown = "no_op";
          };

          insert = {
            "S-right" = ":buffer-next";
            "S-left" = ":buffer-previous";
            up = "move_line_up";
            down = "move_line_down";
            left = "move_char_left";
            right = "move_char_right";
            pageup = "no_op";
            pagedown = "no_op";
          };
        };
      };
    };

    home.packages = with pkgs; [
      nodePackages.bash-language-server
      nodePackages.dockerfile-language-server-nodejs
      nodePackages.vscode-langservers-extracted
      taplo-lsp
      yaml-language-server
      clang
      marksman
      # gcc
    ];
  };
}
