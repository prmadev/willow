{lib, ...}:
with lib; {
  options = {
    global-fonts = {
      main-family = mkOption {
        type = types.str;
        default = "Operator Mono";
      };

      main-black = mkOption {
        type = types.str;
        default = "Operator Mono Bold";
      };
      main-black-italic = mkOption {
        type = types.str;
        default = "Operator Mono Bold Italic";
      };
      main-bold = mkOption {
        type = types.str;
        default = "Operator Mono Bold";
      };
      main-bold-italic = mkOption {
        type = types.str;
        default = "Operator Mono Bold Italic";
      };
      main-medium = mkOption {
        type = types.str;
        default = "Operator Mono Medium";
      };
      main-medium-italic = mkOption {
        type = types.str;
        default = "Operator Mono Medium Italic";
      };
      main-regular = mkOption {
        type = types.str;
        default = "Operator Mono Book";
      };
      main-italic = mkOption {
        type = types.str;
        default = "Operator Mono Book Italic";
      };

      main-light = mkOption {
        type = types.str;
        default = "Operator Mono Light";
      };
      main-light-italic = mkOption {
        type = types.str;
        default = "Operator Mono Light Italic";
      };
      main-thin = mkOption {
        type = types.str;
        default = "Operator Mono Light";
      };
      main-thin-italic = mkOption {
        type = types.str;
        default = "Operator Mono Light Italic";
      };
      main-set = mkOption {
        type = types.listOf types.str;
        default = ["Operator Mono Book" "LigaOperatorMono Nerd Font" "OperatorMono Nerd Font Mono" "ComicCodeLigatures Nerd Font" "ComicCodeLigatures Nerd Font Complete Mono" "Gintronic" "Vazirmatn"];
      };
    };
  };
}
