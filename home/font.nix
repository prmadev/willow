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
      default = "Lotion";
    };

    gtkconf.enable = mkEnableOption "gtkConf settings";
  };
  #  | -> :=  some things -> f
  config = mkIf config.font.enable {
    home.pointerCursor = {
      package = pkgs.catppuccin-cursors;
      name = "macchiatoSky";
      x11 = {
        enable = true;
      };
      gtk.enable = true;
      size = 24;
    };
    home.keyboard.options = [
      "grp:alt_shift_toggle,caps:escape"
    ];
    fonts.fontconfig.enable = true;
    gtk = mkIf config.gtkconf.enable {
      enable = true;
      font = {
        name = config.font.main;
        size = 12;
      };

      cursorTheme = {
        package = pkgs.catppuccin-cursors;
        name = "macchiatoSky";
        size = 24;
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
