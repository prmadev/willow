{lib, ...}:
with lib; {
  options = {
    global-fonts = {
      main-family = mkOption {
        type = types.str;
        default = "Maple Mono";
      };

      main-black = mkOption {
        type = types.str;
        default = "Maple Mono Bold";
      };
      main-black-italic = mkOption {
        type = types.str;
        default = "Maple Mono Bold Italic";
      };
      main-bold = mkOption {
        type = types.str;
        default = "Maple Mono Bold";
      };
      main-bold-italic = mkOption {
        type = types.str;
        default = "Maple Mono Bold Italic";
      };
      main-medium = mkOption {
        type = types.str;
        default = "Maple Mono Bold";
      };
      main-medium-italic = mkOption {
        type = types.str;
        default = "Maple Mono Bold Italic";
      };
      main-regular = mkOption {
        type = types.str;
        default = "Maple Mono";
      };
      main-italic = mkOption {
        type = types.str;
        default = "Maple Mono Italic";
      };

      main-light = mkOption {
        type = types.str;
        default = "Maple Mono Light";
      };
      main-light-italic = mkOption {
        type = types.str;
        default = "Maple Mono Light Italic";
      };
      main-thin = mkOption {
        type = types.str;
        default = "Maple Mono Light";
      };
      main-thin-italic = mkOption {
        type = types.str;
        default = "Maple Mono Light Italic";
      };
      main-set = mkOption {
        type = types.listOf types.str;
        default = ["Maple Mono" "Pragmata Pro" "Pragmata Pro Mono" "Belinsky" "Operator Mono Book" "Operator Mono Regular" "" "OperatorMono Nerd Font Mono" "ComicCodeLigatures Nerd Font" "ComicCodeLigatures Nerd Font Complete Mono" "Gintronic" "Vazirmatn"];
      };
    };
  };
}
