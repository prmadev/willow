{inputs, ...}: {
  imports = [
    ./general.nix
    ./firefox.nix
    ./chromium.nix
    ./qute.nix
    ./senpai.nix
    ./tiny.nix
    ./slack.nix
    ./syncthing.nix
    ./telegram.nix
    ./exercism.nix
    ./graphical.nix
    ./hoard.nix
    ./task.nix
    ./newsboat.nix
    ./zk.nix
    ./music.nix
    ./rofi.nix
    ./general.nix
    ./atuin.nix
    ./typst.nix
    ./irssi.nix
    ./kitty.nix
    ./wezterm
    ./zellij.nix
    ./tmux.nix
    ./foot.nix
    ./insomnia.nix
    ./android_file_browser.nix
    ./compression.nix
    ./filesearch.nix
    ./ranger.nix
    ./mpv.nix
    ./nnn.nix
    ./office.nix
    ./pdf.nix
    ./rename.nix
    ./xdgconf.nix
    ./broot.nix
    ./lf.nix
    ./river.nix
    ./waybar.nix
    ./mako.nix
    ./hyprland.nix
    ./sway
    ./eww
    ./picom.nix
    ./global-fonts.nix
    ./colors.nix
    ./font.nix
    ./alias.nix
    ./doc.nix
    ./fzf.nix
    ./pager.nix
    ./starship.nix
    ./snippet.nix
    ./bash.nix
    ./fish.nix
    ./nu.nix
    ./zsh.nix
    ./skim.nix
    ./audio.nix
    ./partition.nix
    ./download.nix
    ./proxy.nix
    ./ssh.nix
    ./bw.nix
    ./gpg.nix
    ./agenix.nix
    ./discord.nix
    ./wayland.nix
    ./development
    ./monitor.nix
    ./pueue.nix
  ];

  firefox.enable = true;
  qutebrowser.enable = false;
  tiny.enable = true;
  telegram.enable = true;
  discord.enable = true;
  exercism.enable = false;
  graphical.enable = true;
  task.enable = false;
  hoard.enable = false;
  zk.enable = false;
  newsboat.enable = false;
  syncthing.enable = false;
  music.enable = true;
  typst.enable = false;
  irssi.enable = true;
  senpai.enable = true;
  audio.enable = true;
  partition.enable = true;
  rofi.enable = true;
  android.enable = true;
  compression.enable = true;
  filesearch.enable = true;
  nnn.enable = true;
  office.enable = false;
  ranger.enable = true;
  mpv.enable = true;
  pueue.enable= true;
  pdf.enable = true;
  rename.enable = true;
  xdgconf.enable = true;
  brootFile.enable = true;
  lf.enable = true;
  chrome.enable = true;
  atuin.enable = false;
  download.enable = true;
  proxy.enable = true;
  ssh.enable = true;
  general.enable = true;
  bw.enable = true;
  gpg.enable = true;
  ragenix.enable = true;
  alias.enable = true;
  bash.enable = true;
  doc.enable = true;
  fish.enable = true;
  fzf.enable = true;
  nu.enable = true;
  pager.enable = true;
  starship.enable = true;
  pet.enable = false;
  zsh.enable = true;
  font.enable = true;
  gtkconf.enable = true;
  kitty.enable = false;
  zellij.enable = true;
  wezterm.enable = true;
  tmux.enable = true;
  foot.enable = true;
  mako.enable = true;
  river.enable = true;
  eww.enable = false;
  hyprland.enable = false;
  sway.enable = false;
  wayland.enable = true;
  slack.enable = false;
  picom.enable = false;
  development.enable = true; # development and languages
  monitor.enable = true; # monitoring utilities
  insomnia.enable = false;
  nixpkgs.overlays = [
    inputs.neovim-nightly-overlay.overlay
    (final: prev: {zigpkg = inputs.zig.packages.${prev.system}.master;})
  ];
}
