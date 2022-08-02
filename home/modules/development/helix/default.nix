{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
with lib; {
  imports = [./mocha.nix];
  options = {
    helix.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.helix.enable {
    programs.helix = {
      enable = true;

      languages = [
        {
          name = "nix";
          auto-format = false;
        }
        {
          name = "html";
          file-types = ["html" "tmpl"];
        }

        {
          name = "toml";
          language-server = {command = "${pkgs.taplo-lsp}/bin/taplo-lsp";};
        }
        {
          debugger = {
            name = "go";
            port-arg = "-l 127.0.0.1:19999";
          };
        }
      ];

      # themes = let
      #   catppuccin_helix = inputs.helix-catppuccin;
      #   # catppuccin_helix = pkgs.fetchFromGitHub {
      #   #   owner = "catppuccin";
      #   #   repo = "helix";
      #   #   rev = "dc1d236f610fa9573fa59194c79dd3a5a9c8a639";
      #   #   sha256 = "sha256-JfTS1Kgcdd/Gu05QXWwztHlr9zrIy73YXLvx7iaYAqM=";
      #   # };

      #   variants = ["catppuccin_latte" "catppuccin_frappe" "catppuccin_macchiato" "catppuccin_mocha"];
      # in
      #   lib.genAttrs variants (n: builtins.fromTOML (builtins.readFile "${catppuccin_helix}/italics/${n}.toml"));

      settings = {
        theme = "catppuccin-mocha";

        # indent-guides.render = true;
        editor = {
          auto-format = false;
          completion-trigger-len = 1;
          line-number = "relative";

          # indent-style = "t";
          cursor-shape = {
            insert = "bar";
            normal = "block";
            select = "block";
          };
        };

        keys = {
          normal = {
            ret = ["open_below" "normal_mode"];
            space = {
              c = {
                f = ":format";
                w = ":w!";
                q = ":q";
                b = ":bc";
              };
              g = {
                i = ["select_all" ":pipe goimport"];
                f = ["select_all" ":pipe gofumpt" ":pipe goimport"];

                t = ":run-shell-command go mod tidy";
                g = ":run-shell-command go get -u";
              };
              n = {
                f = ["select_all" ":pipe alejandra"];
              };
            };
          };
          insert = {
            "A-ret" = "open_below";
          };
        };
      };
    };
    home.packages = with pkgs; [
      nodePackages.bash-language-server
      nodePackages.dockerfile-language-server-nodejs
      nodePackages.vscode-langservers-extracted
      taplo-lsp
    ];
  };
}
