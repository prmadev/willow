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
      envFile.text = "starship init nu | save ~/.cache/starship/init.nu";
      configFile.text = let
        starship_shell_env = "let-env STARSHIP_SHELL = \"nu\"";
        leftPrompt = "def create_left_prompt [] { starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)' }";
        misc = ''
          let-env PROMPT_COMMAND = { create_left_prompt }

          let-env PROMPT_COMMAND_RIGHT = ""
          let-env PROMPT_INDICATOR = ""
          let-env PROMPT_INDICATOR_VI_INSERT = ": "
          let-env PROMPT_INDICATOR_VI_NORMAL = "〉"
          let-env PROMPT_MULTILINE_INDICATOR = "::: "
          let-env config = {
          		 filesize_metric: false
          		 table_mode: compact
          		 use_ls_colors: false
                		 EDITOR: hx
          }

          source ~/.cache/starship/init.nu
        '';
      in
        builtins.concatStringsSep "\n" [starship_shell_env leftPrompt misc];
    };
  };
}
