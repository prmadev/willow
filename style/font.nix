{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    global-fonts = {
      main-family = mkOption {
        type = types.str;
        default = "Operator Mono SSm Nerd Lig Light";
      };

      main-black = mkOption {
        type = types.str;
        default = "Operator Mono SSm Nerd Lig Bold";
      };
      main-black-italic = mkOption {
        type = types.str;
        default = "Operator Mono SSm Bold Italic Nerd Font";
      };
      main-bold = mkOption {
        type = types.str;
        default = "Operator Mono SSm Bold Nerd Font";
      };
      main-bold-italic = mkOption {
        type = types.str;
        default = "Operator Mono SSm Bold Italic Nerd Font";
      };
      main-medium = mkOption {
        type = types.str;
        default = "Operator Mono SSm Medium Nerd Font";
      };
      main-medium-italic = mkOption {
        type = types.str;
        default = "Operator Mono SSm Medium Italic Nerd Font";
      };
      main-regular = mkOption {
        type = types.str;
        default = "Operator Mono SSm Book Nerd Font";
      };
      main-italic = mkOption {
        type = types.str;
        default = "Operator Mono SSm Book Italic Nerd Font";
      };

      main-light = mkOption {
        type = types.str;
        default = "Operator Mono SSm Light Nerd Font";
      };
      main-light-italic = mkOption {
        type = types.str;
        default = "Operator Mono SSm Light Italic Nerd Font";
      };
      main-thin = mkOption {
        type = types.str;
        default = "Operator Mono SSm Light Nerd Font";
      };
      main-thin-italic = mkOption {
        type = types.str;
        default = "Operator Mono SSm Light Italic Nerd Font";
      };
      main-set = mkOption {
        type = types.listOf types.str;
        default = ["Operator Mono SSm Nerd Lig Book" "Operator Mono Book Nerd Font Complete Mono" "Gintronic" "Vazirmatn"];
      };
    };
  };
}
