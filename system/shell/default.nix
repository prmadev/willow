{
  config,
  pkgs,
  ...
}: {
  # environment.shells = [pkgs.bashInteractive pkgs.zsh];
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

  environment.pathsToLink = ["/share/zsh"];

  environment.systemPackages = with pkgs; [
    neovim #just in case I need it at system level
    curl # obvious
    # zsh
  ];

  console.colors = [
    "403c58"
    "ea6f91"
    "9bced7"
    "f1ca93"
    "34738e"
    "c3a5e6"
    "eabbb9"
    "faebd7"
    "6f6e85"
    "ea6f91"
    "9bced7"
    "f1ca93"
    "34738e"
    "c3a5e6"
    "eabbb9"
    "ffffff"
  ];
  services.atd.enable = true;
  services.dbus.enable = true;
  # services.dbus.packages = [pkgs.gcr];

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.git.enable = true;

  security.polkit.enable = true;
  programs.dconf.enable = true;
  programs.mtr.enable = true;
  environment.localBinInPath = true;
  environment.homeBinInPath = true;
}
