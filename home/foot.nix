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
          shell = "fish";
          font = "${config.global-fonts.main-regular}:size=18";
          font-italic = "${config.global-fonts.main-italic}:size=18:style=Italic";
          font-bold = "${config.global-fonts.main-black}:size=18:style=ExtraBold";
          font-bold-italic = "${config.global-fonts.main-black-italic}:size=18:style=ExtraBold Italic";
          box-drawings-uses-font-glyphs = true;
          bold-text-in-bright = false;
        };
        scrollback = {
          lines = 10000;
        };
        colors = with config.colors.moon; {
          foreground = text.rawHex; # Text
          background = base.rawHex; # Base
          regular0 = overlay.rawHex; # Surface 1
          regular1 = love.rawHex; # red
          regular2 = pine.rawHex; # green
          regular3 = gold.rawHex; # yellow
          regular4 = foam.rawHex; # blue
          regular5 = iris.rawHex; # pink
          regular6 = rose.rawHex; # teal
          regular7 = text.rawHex; # Subtext 1
          bright0 = overlay.rawHex; # Surface 2
          bright1 = love.rawHex; # red
          bright2 = pine.rawHex; # green
          bright3 = gold.rawHex; # yellow
          bright4 = foam.rawHex; # blue
          bright5 = iris.rawHex; # pink
          bright6 = rose.rawHex; # teal
          bright7 = text.rawHex; # Subtext 0
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
