{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    font.enable = mkEnableOption "font settings";

    font.main = mkOption {
      type = types.str;
      default = "Operator Mono";
    };

    gtkconf.enable = mkEnableOption "gtkConf settings";
  };

  config = mkIf config.font.enable {
    fonts.fontconfig.enable = true;
    gtk = mkIf config.gtkconf.enable {
      enable = true;
      font = {
        name = config.font.main;
        size = 12;
      };

      theme = {
        name = "Catppuccin-Macchiato-Standard-Pink-Dark";
        package = pkgs.catppuccin-gtk.override {
          accents = ["pink"];
          variant = "macchiato";
        };
      };
    };

    home.packages = with pkgs; [
      nerd-font-patcher
    ];
  };
}
