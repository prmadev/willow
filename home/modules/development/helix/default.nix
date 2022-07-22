{ pkgs
, lib
, config
, ...
}:
with lib; {
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
          file-types = [ "html" "tmpl" ];
        }
      ];

      settings = {
        theme = "rose_pine";
        editor = {
          auto-format = false;
          line-number = "relative";
          cursor-shape = {
            insert = "bar";
            normal = "block";
            select = "block";
          };
        };
      };
    };
    home.packages = with pkgs;[
      nodePackages.bash-language-server
      nodePackages.dockerfile-language-server-nodejs
      nodePackages.vscode-langservers-extracted
      taplo-lsp
    ];
  };
}
