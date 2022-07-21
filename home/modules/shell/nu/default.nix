{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    nu.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.nu.enable {
    programs.nushell = {
      enable = true;
      envFile.text = ''
        starship init nu | save ~/.cache/starship/init.nu
      '';
      configFile.text = ''
        let-env config = {
             filesize_metric: false
             table_mode: rounded
             use_ls_colors: false
           }
             source ~/.cache/starship/init.nu
      '';
    };
  };
}
