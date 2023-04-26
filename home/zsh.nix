{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
with lib; {
  options.zsh.enable = mkEnableOption "zsh settings";

  config = mkIf config.zsh.enable {
    programs.zsh = {
      enable = true;
      defaultKeymap = "emacs";
      enableAutosuggestions = true;
      enableCompletion = true;
      enableSyntaxHighlighting = true;
      enableVteIntegration = true;
      localVariables = {
        DISABLE_CORRECTION = true;
        SKIM_BASE = "${pkgs.skim}/bin/sk";
      };

      autocd = true;
      initExtra = ''
        # eval "$(zellij setup --generate-auto-start zsh)"
        # if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
        			# exec tmux
        # fi

        export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS"
        --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
        --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
        --color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"
      '';
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
          src = inputs.catppuccin-zsh;
          name = "catpuccin-zsh";
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
        {
          src = inputs.zsh-skim;
          name = "zsh-skim";
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
