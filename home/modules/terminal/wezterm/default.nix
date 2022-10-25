{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    wezterm.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.wezterm.enable {
    programs.wezterm = {
      enable = true;
      extraConfig = ''
        return {
        color_scheme = "Rosé Pine (base16)",
         }
      '';
    };
  };
}
