{
  lib,
  config,
  ...
}:
with lib; {
  imports = [
    ./kitty
    ./tmux
    ./wezterm
    ./zellij
  ];
  options = {
    terminal.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.terminal.enable {
    kitty.enable = true;
    tmux.enable = false;
    zellij.enable = true;
    wezterm.enable = true;
  };
}
