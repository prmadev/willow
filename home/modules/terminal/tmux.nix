{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options = {
    tmux.enable = mkEnableOption "tmux";
  };
  config = let
    nextToggle = ''bind-key  -n C-\\ next-window'';
  in
    mkIf config.tmux.enable {
      programs.tmux = {
        enable = true;
        terminal = "wezterm";
        historyLimit = 10000;
        escapeTime = 0;
        mouse = true;
        shell = "${pkgs.zsh}/bin/zsh";
        sensibleOnTop = true;
        extraConfig = nextToggle + "\n";
        plugins = with pkgs; [
          tmuxPlugins.open
          tmuxPlugins.tmux-fzf
          {
            plugin = tmuxPlugins.catppuccin;
            extraConfig = "set -g @catppuccin_flavour 'macchiato'\n" + "set -g @catppuccin_window_tabs_enabled on";
          }
          tmuxPlugins.tmux-thumbs
        ];
      };
      home.packages = with pkgs; [
        smug
      ];
    };
}
