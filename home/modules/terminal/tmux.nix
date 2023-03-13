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
  config = mkIf config.terminal.enable {
    programs.tmux = {
      enable = true;
      terminal = "wezterm";
      shell = "${pkgs.zsh}/bin/zsh";
    };
  };
}
