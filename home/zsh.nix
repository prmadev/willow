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

      autosuggestion.enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      enableVteIntegration = true;
      cdpath = [
        "$HOME/Videos/p/p"
        "$HOME/repos/notes"
        "$HOME/repos/asanbilit"
        "$HOME/repos"
        "$HOME/willow"
      ];
      dirHashes = {
        notes = "$HOME/repos/notes";
        vid = "$HOME/Videos";
        dow = "$HOME/Downloads";
        dl = "$HOME/Downloads";
        rep = "$HOME/repos";
        prma = "$HOME/repos/prma";
        ava = "$HOME/repos/asan-availability";
        int = "$HOME/repos/asan-intrabuf";
      };
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
          src = inputs.zsh-nix-completion;
          name = "zsh-nix-shell";
        }
        {
          src = inputs.zsh-nix-shell;
          name = "zsh-nix-shell";
        }
        # {
        #   src = inputs.cd-ls;
        #   name = "cd-ls";
        # }
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

    programs.fzf.enableZshIntegration = config.fzf.enable;
    programs.starship.enableZshIntegration = config.starship.enable;
    programs.zoxide.enableZshIntegration = config.filesearch.enable;
    services.gpg-agent.enableZshIntegration = config.gpg.enable;
  };
}
