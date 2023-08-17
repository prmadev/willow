{lib, ...}:
with lib; {
  options = {
    global-fonts = {
      main-family = mkOption {
        type = types.str;
        default = "Pragmata Pro Mono";
      };

      main-black = mkOption {
        type = types.str;
        default = "Pragmata Pro Mono Bold";
      };
      main-black-italic = mkOption {
        type = types.str;
        default = "Pragmata Pro Mono Bold Italic";
      };
      main-bold = mkOption {
        type = types.str;
        default = "Pragmata Pro Mono Bold";
      };
      main-bold-italic = mkOption {
        type = types.str;
        default = "Pragmata Pro Mono Bold Italic";
      };
      main-medium = mkOption {
        type = types.str;
        default = "Pragmata Pro Mono Bold";
      };
      main-medium-italic = mkOption {
        type = types.str;
        default = "Pragmata Pro Mono Bold Italic";
      };
      main-regular = mkOption {
        type = types.str;
        default = "Pragmata Pro Mono";
      };
      main-italic = mkOption {
        type = types.str;
        default = "Pragmata Pro Mono Italic";
      };

      main-light = mkOption {
        type = types.str;
        default = "Pragmata Pro Mono";
      };
      main-light-italic = mkOption {
        type = types.str;
        default = "Pragmata Pro Mono Italic";
      };
      main-thin = mkOption {
        type = types.str;
        default = "Pragmata Pro Mono";
      };
      main-thin-italic = mkOption {
        type = types.str;
        default = "Pragmata Pro Mono Italic";
      };
      main-set = mkOption {
        type = types.listOf types.str;
        default = ["Pragmata Pro" "Operator Mono Book" "LigaOperatorMono Nerd Font" "OperatorMono Nerd Font Mono" "ComicCodeLigatures Nerd Font" "ComicCodeLigatures Nerd Font Complete Mono" "Gintronic" "Vazirmatn"];
      };
    };
  };
}
