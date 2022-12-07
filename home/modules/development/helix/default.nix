{
  pkgs,
  lib,
  config,
  inputs,
  ...
} @ args:
with lib; {
  imports = [./rosepine.nix];
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
          name = "go";
          auto-format = true;
          formatter = {command = "gofumports";};

          indent = {
            tab-width = 4;
            unit = "  ";
          };
        }
      ];
      settings = {
        theme = "rp";
        editor = {
          shell = ["zsh" "-c"];
          auto-format = true;
          completion-trigger-len = 1;
          line-number = "relative";
          color-modes = true;
          cursorline = true;
          cursorcolumn = true;
          idle-timeout = 0;
          auto-pairs = true;
          bufferline = "always";

          lsp.display-messages = true;
          file-picker.hidden = true;
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
            right = ["selections" "diagnostics" "spinner" "position-percentage"];
          };
        };

        keys = {
          normal = {
            # ret = ["open_below" "normal_mode"];
            X = ["extend_line_above"];
            space = {
              c = ":bc";
            };
          };

          insert = {
            up = "move_line_up";
            down = "move_line_down";
            left = "move_char_left";
            right = "move_char_right";
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
