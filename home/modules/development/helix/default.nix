{
  pkgs,
  lib,
  config,
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
      ];

      settings = {
        theme = "rp";
        editor = {
          auto-format = false;
          completion-trigger-len = 1;
          line-number = "relative";
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
