{lib, ...}:
with lib; {
  options = {
    global-fonts = {
      main-family = mkOption {
        type = types.str;
        default = "Lotion";
      };

      main-black = mkOption {
        type = types.str;
        default = "Lotion Black";
      };
      main-black-italic = mkOption {
        type = types.str;
        default = "Lotion Black Italic";
      };
      main-bold = mkOption {
        type = types.str;
        default = "Lotion Bold";
      };
      main-bold-italic = mkOption {
        type = types.str;
        default = "Lotion Bold Italic";
      };
      main-medium = mkOption {
        type = types.str;
        default = "Lotion SemiBold";
      };
      main-medium-italic = mkOption {
        type = types.str;
        default = "Lotion SemiBold Italic";
      };
      main-regular = mkOption {
        type = types.str;
        default = "Lotion";
      };
      main-italic = mkOption {
        type = types.str;
        default = "Lotion Italic";
      };

      main-light = mkOption {
        type = types.str;
        default = "Lotion";
      };
      main-light-italic = mkOption {
        type = types.str;
        default = "Lotion Italic";
      };
      main-thin = mkOption {
        type = types.str;
        default = "Lotion";
      };
      main-thin-italic = mkOption {
        type = types.str;
        default = "Lotion Italic";
      };
      main-set = mkOption {
        type = types.listOf types.str;
        default = ["Lotion" "Cascadia Code" "Maple Mono" "Pragmata Pro" "Operator Mono Book" "LigaOperatorMono Nerd Font" "OperatorMono Nerd Font Mono" "ComicCodeLigatures Nerd Font" "ComicCodeLigatures Nerd Font Complete Mono" "Gintronic" "Vazirmatn"];
      };
    };
  };
}
