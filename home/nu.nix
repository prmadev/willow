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
  config = let
    nuLibDirs = "${config.xdg.dataHome}/nu_libs";
    job = pkgs.writeTextFile {
      name = "job.nu";
      text = ''
        # spawn task to run in the background
        #
        # please note that a fresh nushell is spawned to execute the given command
        # So it doesn't inherit current scope's variables, custom commands, alias definition, except env variables which value can convert to string.
        #
        # e.g:
        # spawn { echo 3 }
        export def spawn [
            command: block   # the command to spawn
        ] {
            let config_path = $nu.config-path
            let env_path = $nu.env-path
            let source_code = (view source $command | str trim -l -c '{' | str trim -r -c '}')
            let job_id = (pueue add -p $"nu --config \"($config_path)\" --env-config \"($env_path)\" -c '($source_code)'")
            {"job_id": $job_id}
        }

        export def log [
            id: int   # id to fetch log
        ] {
            pueue log $id -f --json
            | from json
            | transpose -i info
            | flatten --all
            | flatten --all
            | flatten status
        }

        # get job running status
        export def status () {
            pueue status --json
            | from json
            | get tasks
            | transpose -i status
            | flatten
            | flatten status
        }

        # kill specific job
        export def kill (id: int) {
            pueue kill $id
        }

        # clean job log
        export def clean () {
            pueue clean
        }

      '';
      destination = "";
    };
  in
    mkIf config.nu.enable {
      programs.nushell = {
        enable = true;
        # envFile.text = "starship init nu | save -f  ~/.cache/starship/init.nu";
        environmentVariables = {
          EDITOR = config.editor.terminal;
          PROMPT_COMMAND = "{ def create_left_prompt [] { starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)' } }";
          # STARSHIP_SHELL = "nu";
          NU_LIB_DIRS = "\"${nuLibDirs}\"";
        };

        configFile.text = let
          misc = ''
            let-env config = {
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



            use job.nu
          '';
        in
          builtins.concatStringsSep "\n" [misc];
      };

      home.file = {
        "${nuLibDirs}/job.nu" = {
          source = job;
        };
      };
      programs.direnv.enableNushellIntegration = config.direnv.enable;
      programs.starship.enableNushellIntegration = config.starship.enable;
      programs.zoxide.enableNushellIntegration = config.filesearch.enable;
    };
}
