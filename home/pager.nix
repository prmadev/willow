{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
with lib; {
  options.pager.enable = mkEnableOption "pager settings";

  config = mkIf config.pager.enable {
    programs.bat = {
      enable = true;
      config = {
        theme = "macchiato";
      };
      extraPackages = with pkgs.bat-extras; [
        prettybat
        batgrep
        batman
        batpipe
        batdiff
      ];
      themes = {
        macchiato = builtins.readFile (inputs.bat-catppuccin + "/Catppuccin-macchiato.tmTheme");
      };
    };
    home.sessionVariables = {
      PAGER = "less";
      LESS = "-g -i -M -R -S -w -X -z-4";
    };
  };
}
