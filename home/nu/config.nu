
let-env STARSHIP_SHELL = "nu"


def create_left_prompt [] {
    starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}

# Use nushell functions to define your right and left prompt
let-env PROMPT_COMMAND = { create_left_prompt }
let-env PROMPT_COMMAND_RIGHT = ""
                      let-env config = {
                           filesize_metric: false
                           table_mode: compact
                           use_ls_colors: false
                	 EDITOR: nvim
                	 VISUAL: nvim
                	}
                source ~/.cache/starship/init.nu
