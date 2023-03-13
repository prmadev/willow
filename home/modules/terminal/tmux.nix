{
  lib,
  config,
  ...
}:
with lib; {
  options = {
    tmux.enable = mkEnableOption "tmux";
  };
  config = mkIf config.terminal.enable {
    programs.tmux = {
      enable = true;
      keyMode = "vi";
      prefix = "C-x";
      shortcut = "x";
      terminal = "wezterm";
    };
  };
}
