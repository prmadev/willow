{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    clock24 = true;
    newSession = true;
    shell = "${pkgs.zsh}/bin/zsh";
    shortcut = "\.";
    tmuxp.enable = true;
    sensibleOnTop = true;
    extraConfig = ''
      bind C-p previous-window
      bind C-n next-window
    '';
  };
}
