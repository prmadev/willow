{pkgs, ...}: {
  programs.zsh.enable = true;
  programs.zsh.enableAutosuggestions = false;
  programs.zsh.enableCompletion = false;
  programs.zsh.enableSyntaxHighlighting = false;
  # programs.zsh.enableVteIntegration = true;
  programs.zsh.autocd = false;
  programs.zsh.oh-my-zsh.enable = false;
  # programs.zsh.prezto.enable = true;
  # programs.zsh.completionInit = "";
  programs.zsh.history.expireDuplicatesFirst = true;
  programs.zsh.history.extended = true;

  programs.zsh.history.ignoreDups = true;
  programs.zsh.dotDir = ".config/zsh";

  programs.zsh.history.save = 30000;
  programs.zsh.history.size = 30000;

  programs.zsh.oh-my-zsh.extraConfig = ''
       HYPHEN_INSENSITIVE="true"
    ENABLE_CORRECTION="true"
  '';

  programs.zsh.oh-my-zsh.plugins = [
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
  # programs.broot.enableZshIntegration = true;

  programs.fzf.enableZshIntegration = true;

  programs.just.enableZshIntegration = true;

  programs.nix-index.enableZshIntegration = true;

  programs.starship.enableZshIntegration = true;

  programs.zoxide.enableZshIntegration = true;

  services.gpg-agent.enableZshIntegration = true;
}
