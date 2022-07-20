{pkgs, ...}: {
  imports = [
    ./kitty
    ./tmux
    ./wezterm
    ./zellij
  ];
}
