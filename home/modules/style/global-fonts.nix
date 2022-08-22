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
        default = "OperatorMonoSSmNerdLig-Book";
      };

      main-black = mkOption {
        type = types.str;
        default = "Operator Mono Bold Nerd Font Complete Mono";
      };
      main-black-italic = mkOption {
        type = types.str;
        default = "Operator Mono Bold Italic Nerd Font Complete Mono";
      };
      main-bold = mkOption {
        type = types.str;
        default = "Operator Mono Bold Nerd Font Complete Mono";
      };
      main-bold-italic = mkOption {
        type = types.str;
        default = "Operator Mono Bold Italic Nerd Font Complete Mono";
      };
      main-medium = mkOption {
        type = types.str;
        default = "Operator Mono Medium Nerd Font Complete Mono";
      };
      main-medium-italic = mkOption {
        type = types.str;
        default = "Operator Mono Medium Italic Nerd Font Complete Mono";
      };
      main-regular = mkOption {
        type = types.str;
        default = "Operator Mono Book Nerd Font Complete Mono";
      };
      main-italic = mkOption {
        type = types.str;
        default = "Operator Mono Book Italic Nerd Font Complete Mono";
      };

      main-light = mkOption {
        type = types.str;
        default = "Operator Mono Light Nerd Font Complete Mono";
      };
      main-light-italic = mkOption {
        type = types.str;
        default = "Operator Mono Light Italic Nerd Font Complete Mono";
      };
      main-thin = mkOption {
        type = types.str;
        default = "Operator Mono Light Nerd Font Complete Mono";
      };
      main-thin-italic = mkOption {
        type = types.str;
        default = "Operator Mono Light Italic Nerd Font Complete Mono";
      };
      main-set = mkOption {
        type = types.listOf types.str;
        default = ["Operator Mono Book Nerd Font Complete Mono" "Gintronic" "Vazirmatn"];
      };
    };
  };
}
