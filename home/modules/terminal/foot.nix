{
  lib,
  config,
  ...
}:
with lib; {
  options = {
    foot.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.foot.enable {
    programs.foot = {
      enable = true;
      server.enable = true;
      settings = {
        main = {
          shell = "zsh";
          font = "monospace:size=7";
          # font-bold  = ""
          box-drawings-uses-font-glyphs = true;
          bold-text-in-bright = true;
        };
        scrollback = {
          lines = 10000;
        };
        colors = {
          foreground = "cad3f5"; # Text
          background = "24273a"; # Base
          regular0 = "494d64"; # Surface 1
          regular1 = "ed8796"; # red
          regular2 = "a6da95"; # green
          regular3 = "eed49f"; # yellow
          regular4 = "8aadf4"; # blue
          regular5 = "f5bde6"; # pink
          regular6 = "8bd5ca"; # teal
          regular7 = "b8c0e0"; # Subtext 1
          bright0 = "5b6078"; # Surface 2
          bright1 = "ed8796"; # red
          bright2 = "a6da95"; # green
          bright3 = "eed49f"; # yellow
          bright4 = "8aadf4"; # blue
          bright5 = "f5bde6"; # pink
          bright6 = "8bd5ca"; # teal
          bright7 = "a5adcb"; # Subtext 0
        };
      };
    };
  };
}
