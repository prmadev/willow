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
      default = "Monaspace Argon";
    };

    gtkconf.enable = mkEnableOption "gtkConf settings";
  };
  #  | -> :=  some things -> f
  config = mkIf config.font.enable {
    # home.pointerCursor = {
    #   # package = pkgs.catppuccin-cursors;
    #   # name = "BreezeX-RoséPine";
    #   x11 = {
    #     enable = false;
    #   };
    #   gtk.enable = false;
    #   size = 24;
    # };
    home.keyboard.options = [
      "grp:alt_shift_toggle,caps:escape"
    ];
    fonts.fontconfig.enable = true;
    # gtk = mkIf config.gtkconf.enable {
    #   # cursorTheme = {
    #   # package = pkgs.phinger-cursors;
    #   # name = "BreezeX-RoséPine";
    #   # };
    #   # cursorTheme = {
    #   #   package = pkgs.catppuccin-cursors;
    #   #   name = "macchiatoSky";
    #   #   size = 24;
    #   # };

    #   # theme = {
    #   #   name = "Catppuccin-Macchiato-Standard-Pink-Dark";
    #   #   package = pkgs.catppuccin-gtk.override {
    #   #     accents = ["pink"];
    #   #     variant = "macchiato";
    #   #   };
    #   # };
    # };

    home.file.themeIndex = {
      text = ''
        [Icon theme]
        Inherits=BreezeX-RoséPine
      '';
      target = ".icons/default/index.theme";
    };
    gtk = {
      enable = true;
      font = {
        name = config.font.main;
        size = 12;
      };
      theme = {
        name = "rose-pine";
        package = pkgs.rose-pine-gtk-theme;
      };

      cursorTheme.name = "BreezeX-RoséPine";
    };

    home.file.rose-pine-cursor = {
      source = ./rose-pine-cursor;
      target = ".icons/BreezeX-RoséPine";
      recursive = true;
    };
    home.packages = with pkgs; [
      nerd-font-patcher
    ];
  };
}
