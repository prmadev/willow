{lib, ...}:
with lib; {
  options = {
    global-fonts = {
      main-family = mkOption {
        type = types.str;
        default = "Operator Mono SSm Nerd Lig";
      };

      main-black = mkOption {
        type = types.str;
        default = "ComicCodeLigatures Nerd Font";
      };
      main-black-italic = mkOption {
        type = types.str;
        default = "ComicCodeLigatures Bold Italic Nerd Font";
      };
      main-bold = mkOption {
        type = types.str;
        default = "ComicCodeLigatures Bold Nerd Font";
      };
      main-bold-italic = mkOption {
        type = types.str;
        default = "ComicCodeLigatures Bold Italic Nerd Font";
      };
      main-medium = mkOption {
        type = types.str;
        default = "ComicCodeLigatures Medium Nerd Font";
      };
      main-medium-italic = mkOption {
        type = types.str;
        default = "ComicCodeLigatures Medium Italic Nerd Font";
      };
      main-regular = mkOption {
        type = types.str;
        default = "ComicCodeLigatures Nerd Font";
      };
      main-italic = mkOption {
        type = types.str;
        default = "ComicCodeLigatures Italic Nerd Font";
      };

      main-light = mkOption {
        type = types.str;
        default = "ComicCodeLigatures Light Nerd Font";
      };
      main-light-italic = mkOption {
        type = types.str;
        default = "ComicCodeLigatures  Light Italic Nerd Font";
      };
      main-thin = mkOption {
        type = types.str;
        default = "ComicCodeLigatures  Light Nerd Font";
      };
      main-thin-italic = mkOption {
        type = types.str;
        default = "ComicCodeLigatures  Light Italic Nerd Font";
      };
      main-set = mkOption {
        type = types.listOf types.str;
        default = ["ComicCodeLigatures Nerd Font" "ComicCodeLigatures Nerd Font Complete Mono" "Gintronic" "Vazirmatn"];
      };
    };
  };
}
