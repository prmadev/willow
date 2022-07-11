{pkgs, ...}: {
  imports = [./zsh];

  programs.info.enable = true;
  programs.bat.enable = true;
  programs.exa.enable = true;
  programs.exa.enableAliases = true;
  programs.fzf.enable = true;
  programs.fzf.changeDirWidgetCommand = "fd --type d";
  programs.fzf.tmux.enableShellIntegration = true;
  programs.starship.enable = true;
  programs.jq.enable = true;

  programs.fzf.enableBashIntegration = true;
  programs.just.enableBashIntegration = true;

  home.shellAliases = {
    tree = "exa --tree --icons";
    ls = "exa --icons";
    b = "br";
    rg = "rg --sort path";
    jctl = "journalctl -p 3 -xb";
    df = "df -h";
    go = "richgo";
    sudo = "sudo -E";
    fzf = "fzf --preview='pistol {}'";
  };
}
