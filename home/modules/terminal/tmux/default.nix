{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    clock24 = true;
    newSession = true;
    shell = "\${pkgs.zsh}/bin/zsh";
    shortcut = "z";
    tmuxp.enable = true;
  };
}
