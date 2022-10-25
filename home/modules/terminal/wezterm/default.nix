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
           hide_tab_bar_if_only_one_tab = true,
           default_prog =  {"${pkgs.zsh}/bin/zsh",},
        }
      '';
    };
  };
}
