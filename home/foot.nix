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
          regular0 = surface.rawHex; # Surface 1
          regular1 = love.rawHex; # red
          regular2 = foam.rawHex; # green
          regular3 = gold.rawHex; # yellow
          regular4 = pine.rawHex; # blue
          regular5 = love.rawHex; # pink
          regular6 = foam.rawHex; # teal
          regular7 = subtle.rawHex; # Subtext 1
          bright0 = surface.rawHex; # Surface 2
          bright1 = love.rawHex; # red
          bright2 = foam.rawHex; # green
          bright3 = gold.rawHex; # yellow
          bright4 = pine.rawHex; # blue
          bright5 = love.rawHex; # pink
          bright6 = foam.rawHex; # teal
          bright7 = muted.rawHex; # Subtext 0
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
