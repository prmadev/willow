{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  options.fuzzel.enable = mkEnableOption "fuzzel settings";

  config = mkIf config.fuzzel.enable {
    programs.fuzzel = {
      enable = true;
      settings = {
        main = {
          terminal = "${pkgs.foot}/bin/foot";
          prompt = "\"\"";
          icons-enabled = false;

          layer = "overlay";
          inner-pad = 30;
        };
        colors = {
          background = config.colors.moon.base.rawHexWithLastFF;
          text = config.colors.moon.text.rawHexWithLastFF;
          match = config.colors.moon.love.rawHexWithLastFF;
          selection = config.colors.moon.text.rawHexWithLastFF;
          selection-text = config.colors.moon.base.rawHexWithLastFF;
          selection-match = config.colors.moon.love.rawHexWithLastFF;
          border = config.colors.moon.base.rawHexWithLastFF;
        };
        border = {
          width = 0;
          radius = 0;
        };
      };
    };

    home.sessionVariables = {
      "LAUNCHER" = "fuzzel";
    };
  };
}
