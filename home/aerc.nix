{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.aerc.enable = mkEnableOption "aerc settings";
  config = mkIf config.aerc.enable {
    programs.aerc = {
      enable = true;
      extraConfig.general.unsafe-accounts-conf = true;
      stylesets = {
        default = {
          "tab.selected.reverse" = true;
        };
      };
    };
    home.packages = with pkgs; [aerc];
  };
}
