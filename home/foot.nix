{
  lib,
  config,
  ...
}:
with lib; {
  options.foot.enable = mkEnableOption "foot settings";

  config = mkIf config.foot.enable {
    programs.foot = {
      enable = true;
      server.enable = true;
      settings = {
        main = {
          shell = "zsh";
          font = "monospace:size=9";
          # font-bold  = ""
          box-drawings-uses-font-glyphs = true;
          bold-text-in-bright = false;
        };
        scrollback = {
          lines = 10000;
        };
        colors = with config.colors.macchiato; {
          foreground = text.rawHex; # Text
          background = base.rawHex; # Base
          regular0 = surface1.rawHex; # Surface 1
          regular1 = red.rawHex; # red
          regular2 = green.rawHex; # green
          regular3 = yellow.rawHex; # yellow
          regular4 = blue.rawHex; # blue
          regular5 = pink.rawHex; # pink
          regular6 = teal.rawHex; # teal
          regular7 = subtext1.rawHex; # Subtext 1
          bright0 = surface2.rawHex; # Surface 2
          bright1 = red.rawHex; # red
          bright2 = green.rawHex; # green
          bright3 = yellow.rawHex; # yellow
          bright4 = blue.rawHex; # blue
          bright5 = pink.rawHex; # pink
          bright6 = teal.rawHex; # teal
          bright7 = subtext0.rawHex; # Subtext 0
        };
        key-bindings = {
          scrollback-up-page = "Control+Shift+Page_Up";
          scrollback-down-page = "Control+Shift+Page_Down";
          scrollback-up-line = "Control+Shift+Up";
          scrollback-down-line = "Control+Shift+Down";
        };
      };
    };
  };
}
