{
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
      # envFile.text = "starship init nu | save -f  ~/.cache/starship/init.nu";
      environmentVariables = {
        EDITOR = "hx";
        PROMPT_COMMAND = "{ def create_left_prompt [] { starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)' } }";
        # STARSHIP_SHELL = "nu";
      };

      configFile.text = let
        misc = ''
          let-env config = {
            filesize_metric: false

            table: {
              mode: compact
            }

            ls: {
              use_ls_colors: false
            }

            cd: {
              abbreviations: true
            }

            shell_integration: true
          }



        '';
      in
        builtins.concatStringsSep "\n" [misc];
    };

    programs.direnv.enableNushellIntegration = config.direnv.enable;
    programs.starship.enableNushellIntegration = config.starship.enable;
    programs.zoxide.enableNushellIntegration = config.filesearch.enable;
  };
}
