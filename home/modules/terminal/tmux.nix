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
  config = mkIf config.tmux.enable {
    programs.tmux = {
      enable = true;
      terminal = "wezterm";
      historyLimit = 10000;
      mouse = true;
      shell = "${pkgs.zsh}/bin/zsh";
      sensibleOnTop = true;
      plugins = [];
    };
  };
}
