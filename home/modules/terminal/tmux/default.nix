{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    clock24 = true;
    newSession = true;
    shell = "${pkgs.zsh}/bin/zsh";
    shortcut = "a";
    tmuxp.enable = true;
    sensibleOnTop = true;
    extraConfig = ''
         bind C-p previous-window
         bind C-n next-window
      # quick pane cycling
      unbind ^A
      bind ^A select-pane -t :.+
         unbind r
         bind r source-file ~/.config/tmux/tmux.conf
    '';
    plugins = with pkgs; [
      tmuxPlugins.continuum
      tmuxPlugins.resurrect
      tmuxPlugins.copycat
      tmuxPlugins.open
      tmuxPlugins.pain-control
      tmuxPlugins.tmux-fzf
      tmuxPlugins.extrakto
      tmuxPlugins.prefix-highlight
      tmuxPlugins.vim-tmux-navigator
    ];
  };
  home.packages = with pkgs; [
    xdg-utils #for open
  ];
}
