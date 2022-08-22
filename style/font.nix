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
        default = "Operator Mono Book";
      };

      main-black = mkOption {
        type = types.str;
        default = "Gintronic Black  Nerd Font";
      };
      main-black-italic = mkOption {
        type = types.str;
        default = "Gintronic Black Italic Nerd Font";
      };
      main-bold = mkOption {
        type = types.str;
        default = "Gintronic Bold Nerd Font";
      };
      main-bold-italic = mkOption {
        type = types.str;
        default = "Gintronic Bold Italic Nerd Font";
      };
      main-medium = mkOption {
        type = types.str;
        default = "Gintronic Medium Nerd Font";
      };
      main-medium-italic = mkOption {
        type = types.str;
        default = "Gintronic Medium Italic Nerd Font";
      };
      main-regular = mkOption {
        type = types.str;
        default = "Gintronic Regular Nerd Font";
      };
      main-italic = mkOption {
        type = types.str;
        default = "Gintronic Italic Nerd Font";
      };

      main-light = mkOption {
        type = types.str;
        default = "Gintronic Light Nerd Font";
      };
      main-light-italic = mkOption {
        type = types.str;
        default = "Gintronic Light Italic Nerd Font";
      };
      main-thin = mkOption {
        type = types.str;
        default = "Gintronic Thin Nerd Font";
      };
      main-thin-italic = mkOption {
        type = types.str;
        default = "Gintronic Thin Italic Nerd Font";
      };
      main-set = mkOption {
        type = types.listOf types.str;
        default = ["Gintronic Nerd Font" "Gintronic" "Vazirmatn"];
      };
    };
  };
}
