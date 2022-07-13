{
  pkgs,
  inputs,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    enableVteIntegration = true;
    autocd = true;
    dotDir = ".config/zsh";

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
    ];

    #prezto.enable = true;
    #
    oh-my-zsh = {
      enable = true;
      extraConfig = ''
        HYPHEN_INSENSITIVE="true"
        ENABLE_CORRECTION="true"
      '';

      plugins = [
        "colored-man-pages"
        "colorize"
        "compleat"
        # "colors"

        "fzf"
        # "fzf-zsh-completions"
        # "fzf-marks"
        # "fzf-finder"
        # "fzf-zsh-plugin"
        # "fzf-tab"
        #
        "git-lfs"
        "gitfast"
        "git-extras"
        "github"
        "gh"
        "gitignore"
        "golang"
        "gpg-agent"
        # "globalias"
        "history"
        "history-substring-search"
        "keychain"
        "man"
        "npm"
        "per-directory-history"
        "pip"
        "python"
        "repo"
        "rsync"
        "rbw"
        "ripgrep"
        "rust"
        "ssh-agent"
        "shell-proxy"
        "systemd"
        "taskwarrior"
        # "thefuck"
        "transfer"
        "universalarchive"
        "urltools"
        "web-search"
        "zoxide"
        "zsh-interactive-cd"
        # "zsh-autosuggestions"
        # "zsh-bash-completions-fallback"
        # "completion"
        # "fast-syntax-highlighting"
        # "zsh-syntax-highlighting"
      ];
    };
  };
  # programs.broot.enableZshIntegration = true;
  #
  programs.fzf.enableZshIntegration = true;

  programs.just.enableZshIntegration = true;

  programs.nix-index.enableZshIntegration = true;

  programs.starship.enableZshIntegration = true;

  programs.zoxide.enableZshIntegration = true;

  services.gpg-agent.enableZshIntegration = true;
}
