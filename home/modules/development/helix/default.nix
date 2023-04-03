{
  pkgs,
  lib,
  config,
  inputs,
  ...
} @ args:
with lib; {
  imports = [./rosepine.nix ./catppuccin-improved.nix];
  options = {
    helix.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.helix.enable {
    programs.helix = {
      enable = true;
      package = inputs.helix.packages.${pkgs.system}.default;
      languages = [
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "alejandra";
            args = ["--quiet"];
          };
        }
        {
          name = "html";
          file-types = ["html" "tmpl"];
        }

        {
          name = "toml";
          language-server = {command = "${pkgs.taplo-lsp}/bin/taplo";};
        }

        {
          name = "rust";
          language-server = {
            command = "${pkgs.rust-analyzer}/bin/rust-analyzer";
          };
          config = {
            check = {
              command = "${pkgs.clippy}/bin/cargo-clippy";
              args = ["--workspace" "--all-targets" "--all-features"];
            };
          };
        }
        {
          name = "go";
          auto-format = true;
          formatter = {command = "gofumpt";};

          indent = {
            tab-width = 4;
            unit = "  ";
          };
        }
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
          lsp.display-messages = true;
          lsp.display-inlay-hints = true;
          lsp.display-signature-help-docs = true;
          indent-guides = {
            render = true;
            character = "│";
          };
          cursor-shape = {
            insert = "bar";
            normal = "block";
            select = "block";
          };
          statusline = {
            left = ["mode"];
            center = ["file-name"];
            right = ["diagnostics" "spinner" "position-percentage"];
          };

          # tools
          auto-pairs = true;
          file-picker.hidden = false;
        };

        keys = {
          normal = {
            "S-right" = ":buffer-next";
            "S-left" = ":buffer-previous";
            "S-l" = ":buffer-next";
            "S-h" = ":buffer-previous";
            # ret = ["open_below" "normal_mode"];
            X = ["extend_line_above"];
            space = {
              c = ":bc";
              R = [":clipboard-paste-replace"];
            };
            # y = [":clipboard-yank-join"];
            # p = [":clipboard-paste-after"];
            # P = [":clipboard-paste-before"];
            # d = [":clipboard-yank-join" "delete_selection"];
          };
          select = {
            "S-right" = ":buffer-next";
            "S-left" = ":buffer-previous";
            y = [":clipboard-yank-join"];
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
    ];
  };
}
