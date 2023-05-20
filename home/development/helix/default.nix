{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
with lib; {
  imports = [./rosepine.nix ./catppuccin-improved.nix];

  options.helix.enable = mkEnableOption "helix settings";

  config = mkIf config.helix.enable {
    programs.helix = {
      enable = true;
      package = inputs.helix.packages.${pkgs.system}.default;

      languages = let
        nixSettings = {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "alejandra";
            args = ["--quiet"];
          };
        };

        htmlSettings = {
          name = "html";
          file-types = ["html" "tmpl"];
        };

        tomlSettings = {
          name = "toml";
          language-server = {command = "${pkgs.taplo-lsp}/bin/taplo";};
        };

        rustSettings = {
          name = "rust";
          language-server = {
            command = "${pkgs.rust-analyzer}/bin/rust-analyzer";
          };
          config = {
            check = {
              command = "clippy";
              args = ["--workspace" "--all-targets" "--all-features"];
            };
          };
        };

        goSettings = {
          name = "go";
          auto-format = true;
          formatter = {command = "gofumpt";};

          indent = {
            tab-width = 4;
            unit = "  ";
          };
        };
      in [
        nixSettings
        htmlSettings
        tomlSettings
        rustSettings
        goSettings
      ];

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
              R = [":clipboard-paste-replace"];
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

    home.file = {
      lfPick = {
        enable = true;
        executable = true;
        source = pkgs.writeShellScript "lf-pick" ''
          function lfp(){
            local TEMP=$(mktemp)
            lf -selection-path=$TEMP
            cat $TEMP
          }

          lfp
        '';

        target = ".local/bin/lf-pick";
      };
    };
  };
}
