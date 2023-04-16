{
  lib,
  config,
  ...
}:
with lib; {
  imports = [
    ./kitty
    ./wezterm
    ./zellij
    ./tmux.nix
    ./foot.nix
  ];
  options = {
    terminal.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.terminal.enable {
    kitty.enable = false;
    zellij.enable = true;
    wezterm.enable = true;
    tmux.enable = true;
    foot.enable = true;
  };
}
