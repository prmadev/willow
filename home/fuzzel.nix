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
          background = config.colors.macchiato.base.rawHexWithLastFF;
          text = config.colors.macchiato.text.rawHexWithLastFF;
          match = config.colors.macchiato.red.rawHexWithLastFF;
          selection = config.colors.macchiato.text.rawHexWithLastFF;
          selection-text = config.colors.macchiato.base.rawHexWithLastFF;
          selection-match = config.colors.macchiato.red.rawHexWithLastFF;
          border = config.colors.macchiato.base.rawHexWithLastFF;
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
