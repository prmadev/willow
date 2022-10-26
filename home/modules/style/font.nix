{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    font.enable = mkOption {
      type = types.bool;
      default = false;
    };
    font.main = mkOption {
      type = types.str;
      default = "ComicCodeLigatures Nerd Font";
    };
  };

  config = mkIf config.font.enable {
    fonts.fontconfig.enable = true;
    gtk = mkIf config.gtkconf.enable {
      font = {
        name = config.font.main;
        size = 12;
      };
    };
    home.packages = with pkgs; [
      nerd-font-patcher
    ];
  };
}
