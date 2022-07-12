{pkgs, ...}: {
  imports = [
    ./zsh
    # ./bash
    ./nu
  ];

  programs.info.enable = true;
  programs.tealdeer.enable = true;
  programs.bat.enable = true;
  programs.exa.enable = true;
  programs.exa.enableAliases = true;
  programs.fzf.enable = true;
  programs.fzf.changeDirWidgetCommand = "fd --type d";
  programs.fzf.tmux.enableShellIntegration = true;
  programs.starship.enable = true;
  programs.jq.enable = true;

  programs.man.generateCaches = true;
  programs.pet.enable = true; # TODO

  home.shellAliases = {
    tree = "exa --tree --icons";
    b = "br";
    rg = "rg --sort path";
    jctl = "journalctl -p 3 -xb";
    df = "df -h";
    go = "richgo";
    sudo = "sudo -E";
    fzf = "fzf --preview='pistol {}'";
  };
}
