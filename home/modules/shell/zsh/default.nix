{
  pkgs,
  inputs,
  ...
}: {
  programs.zsh = {
    enable = true;
    defaultKeymap = "viins";
    enableAutosuggestions = false;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    enableVteIntegration = true;
    localVariables = {
      DISABLE_CORRECTION = true;
    };
    autocd = true;
	initExtra = ''
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS"
 --color=fg:#e0def4,bg:#1f1d2e,hl:#6e6a86
 --color=fg+:#908caa,bg+:#191724,hl+:#908caa
 --color=info:#9ccfd8,prompt:#f6c177,pointer:#c4a7e7
 --color=marker:#ebbcba,spinner:#eb6f92,header:#ebbcba"
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
        name = "ansible-zsh";
        src = inputs.ansible-zsh;
      }
      {
        src = inputs.cd-ls;
        name = "cd-ls";
      }
      {
        src = inputs.fzf-tab;
        name = "fzf-tab";
      }
    ];

    prezto = {
      enable = false;
      editor.dotExpansion = true;
      editor.keymap = "vi";
      editor.promptContext = true;
      tmux = {
        # autoStartLocal = true;

        # autoStartRemote = true;
      };
      pmodules = [
        "environment"
        "terminal"
        "editor"
        "history"
        "directory"
        "archive"
        "git"
        "rsync"
        # "gpg"
        "ssh"
        "tmux"
        "spectrum"
        # "utility" #causes non-nixos binaries shit out
        "completion"
        # "prompt"
      ];
    };
    #
    # oh-my-zsh = {
    #   # enable = true;
    #   extraConfig = ''
    #     HYPHEN_INSENSITIVE="true"
    #     ENABLE_CORRECTION="true"
    #
    #   '';
    #
    #   plugins = [
    #     "colored-man-pages"
    #     "colorize"
    #     "compleat"
    #     # "colors"
    #
    #     "fzf"
    #     # "fzf-zsh-completions"
    #     # "fzf-marks"
    #     # "fzf-finder"
    #     # "fzf-zsh-plugin"
    #     # "fzf-tab"
    #     #
    #     "git-lfs"
    #     "gitfast"
    #     "git-extras"
    #     "github"
    #     "gh"
    #     "gitignore"
    #     "golang"
    #     "gpg-agent"
    #     # "globalias"
    #     "history"
    #     "history-substring-search"
    #     "keychain"
    #     "man"
    #     "npm"
    #     "per-directory-history"
    #     "pip"
    #     "python"
    #     "repo"
    #     "rsync"
    #     "rbw"
    #     "ripgrep"
    #     "rust"
    #     "ssh-agent"
    #     "shell-proxy"
    #     "systemd"
    #     "taskwarrior"
    #     # "thefuck"
    #     "transfer"
    #     "universalarchive"
    #     "urltools"
    #     "web-search"
    #     "zoxide"
    #     "zsh-interactive-cd"
    #     # "zsh-autosuggestions"
    #     # "zsh-bash-completions-fallback"
    #     # "completion"
    #     # "fast-syntax-highlighting"
    #     # "zsh-syntax-highlighting"
    #   ];
    # };
  };
  # programs.broot.enableZshIntegration = true;
  #
  programs.fzf.enableZshIntegration = true;

  # programs.just.enableZshIntegration = true;

  programs.nix-index.enableZshIntegration = true;

  programs.starship.enableZshIntegration = true;

  programs.zoxide.enableZshIntegration = true;

  services.gpg-agent.enableZshIntegration = true;
}
