{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
with lib; {
  options = {
    zsh.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf config.zsh.enable {
    programs.zsh = {
      enable = true;
      # defaultKeymap = "viins";
      enableAutosuggestions = true;
      enableCompletion = true;
      enableSyntaxHighlighting = true;
      enableVteIntegration = true;
      localVariables = {
        DISABLE_CORRECTION = true;
      };

      autocd = true;
      initExtra = ''
        if command -v zellij &> /dev/null && [-n "$PS1"] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ zellij]] && [[ ! "$TERM" =~ tmux]] && [-z "$ZELLIJ"]; then
         eval "$(zellij setup --generate-auto-start zsh)"
        fi

        if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
        			exec tmux
        fi

            export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS"
             --color=fg:#e0def4,bg:#1f1d2e,hl:#6e6a86
             --color=fg+:#908caa,bg+:#191724,hl+:#908caa
             --color=info:#9ccfd8,prompt:#f6c177,pointer:#c4a7e7
             --color=marker:#ebbcba,spinner:#eb6f92,header:#ebbcba"
      '';
      # TODO use the module
      # TODO check the old config for extra parameteres
      # TODO move  to fish
      dotDir = ".config/zsh";
      completionInit = "autoload -U compinit && compinit";
      history.expireDuplicatesFirst = true;
      history.extended = true;
      history.ignoreDups = true;
      history.save = 3000000;
      history.size = 30000000;
      plugins = [
        {
          src = inputs.cd-ls;
          name = "cd-ls";
        }
        {
          src = inputs.fzf-tab;
          name = "fzf-tab";
        }
        {
          src = inputs.zsh-windows-title;
          name = "zsh-windows-title";
        }

        {
          src = inputs.zsh-terminal-title;
          name = "zsh-terminal-title";
        }
        {
          src = inputs.zsh-tab-title;
          name = "zsh-tab-title";
        }
      ];
    };

    programs.fzf.enableZshIntegration = mkIf config.fzf.enable true;
    programs.nix-index.enableZshIntegration = true;
    programs.starship.enableZshIntegration = mkIf config.prompt.enable true;
    programs.zoxide.enableZshIntegration = mkIf config.filesearch.enable true;
    services.gpg-agent.enableZshIntegration = mkIf config.gpg.enable true;
  };
}
