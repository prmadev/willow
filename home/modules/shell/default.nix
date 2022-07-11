{pkgs, ...}: {
  imports = [./zsh];
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
