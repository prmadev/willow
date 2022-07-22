{
  pkgs,
  lib,
  config,
  ...
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
          auto-format = true;
        }
      ];
      settings = {
        theme = "rose_pine";
        editor = {
          line-number = "relative";
          cursor-shape = {
            insert = "bar";
            normal = "block";
            select = "underline";
          };
        };
      lsp = {
        display-messages = true;
      };
      keys = {
        normal = {
        };
      };
      };
    };
  };
}
