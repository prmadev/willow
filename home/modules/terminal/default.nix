{
  pkgs,
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
    tmux.enable = true;
    zellij.enable = false;
    wezterm.enable = true;
  };
}
