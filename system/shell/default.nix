{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = false;
    vteIntegration = true;
    shellInit = "eval \"$(starship init zsh)\"";
    ohMyZsh = {
      # enable = true;
      customPkgs = with pkgs; [
        fzf-zsh
      ];
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
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    enableBashCompletion = true;
  };

  # environment.pathsToLink = ["/share/zsh"];

  environment.systemPackages = with pkgs; [
    neovim #just in case I need it at system level
    curl # obvious
    # zsh
  ];

  services.atd.enable = true;

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.git.enable = true;

  security.polkit.enable = true;
  programs.mtr.enable = true;
  environment.localBinInPath = true;
  environment.homeBinInPath = true;
}
