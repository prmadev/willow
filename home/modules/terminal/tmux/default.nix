{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    clock24 = true;
    newSession = true;
    # shell = "zsh";
    shortcut = "z";
    tmuxp.enable = true;
  };
}
