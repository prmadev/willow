{lib, ...}:
with lib; {
  options = {
    global-fonts = {
      main-family = mkOption {
        type = types.str;
        default = "Monaspace Argon Var";
      };
      second-family = mkOption {
        type = types.str;
        default = "Monaspace Radon Var";
      };

      main-black = mkOption {
        type = types.str;
        default = "Monaspace Argon ExtraBold";
      };
      main-black-italic = mkOption {
        type = types.str;
        default = "Monaspace Radon ExtraBold Italic";
      };
      main-bold = mkOption {
        type = types.str;
        default = "Monaspace Argon Bold";
      };
      main-bold-italic = mkOption {
        type = types.str;
        default = "Monaspace Radon Bold Italic";
      };
      main-medium = mkOption {
        type = types.str;
        default = "Monaspace Argon Medium";
      };
      main-medium-italic = mkOption {
        type = types.str;
        default = "Monaspace Radon Medium Italic";
      };
      main-regular = mkOption {
        type = types.str;
        default = "Monaspace Argon";
      };
      main-italic = mkOption {
        type = types.str;
        default = "Monaspace Radon Italic";
      };

      main-light = mkOption {
        type = types.str;
        default = "Monaspcae Argon Light";
      };
      main-light-italic = mkOption {
        type = types.str;
        default = "Monaspace Radon Light Italic";
      };
      main-thin = mkOption {
        type = types.str;
        default = "Monaspace Argon ExtraLight";
      };
      main-thin-italic = mkOption {
        type = types.str;
        default = "Monaspace Radon ExtraLight Italic";
      };
      main-set = mkOption {
        type = types.listOf types.str;
        default = ["Monaspace Argon" "Monaspace Radon" "Lotion" "Cascadia Code" "Maple Mono" "Pragmata Pro" "Operator Mono Book" "LigaOperatorMono Nerd Font" "OperatorMono Nerd Font Mono" "ComicCodeLigatures Nerd Font" "ComicCodeLigatures Nerd Font Complete Mono" "Gintronic" "Vazirmatn"];
      };
      sans-set = mkOption {
        type = types.listOf types.str;
        default = ["Mona Sans" "Hubot Sans" "Vazirmatn"];
      };
    };
  };
}
