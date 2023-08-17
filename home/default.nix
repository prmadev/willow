{
  inputs,
  system,
  ...
}: {
  imports = [
    ./general.nix
    ./firefox.nix
    ./fuzzel.nix
    ./chromium.nix
    ./qute.nix
    ./senpai.nix
    ./tiny.nix
    ./slack.nix
    ./syncthing.nix
    ./pinentry.nix
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
    ./wofi.nix
    ./irssi.nix
    ./kitty.nix
    ./wezterm
    ./zellij.nix
    ./tmux.nix
    ./foot.nix
    ./insomnia.nix
    ./android_file_browser.nix
    ./obs.nix
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
    ./repos.nix
    ./mako.nix
    ./zola.nix
    # ./hyprland.nix
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
    ./yt-dlp.nix
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
    ./monolith.nix
    ./jq.nix
  ];

  yt-dlp.enable = true;
  jq.enable = true;
  monolith.enable = true;
  firefox.enable = true;
  qutebrowser.enable = false;
  tiny.enable = false;
  telegram.enable = true;
  discord.enable = true;
  exercism.enable = true;
  graphical.enable = true;
  task.enable = false;
  hoard.enable = false; # candidate for cleaning
  zk.enable = false;
  zola.enable = true;
  newsboat.enable = false; # candidate for cleaning
  syncthing.enable = false; # candidate for cleaning
  music.enable = true;
  typst.enable = false; # candidate for cleaning
  irssi.enable = true;
  senpai.enable = false; # candidate for cleaning
  audio.enable = true;
  partition.enable = true;
  rofi.enable = true;
  android.enable = true;
  compression.enable = true;
  filesearch.enable = true;
  nnn.enable = true;
  office.enable = true;
  ranger.enable = false;
  mpv.enable = true;
  pueue.enable = false;
  pdf.enable = true;
  rename.enable = true;
  xdgconf.enable = true;
  brootFile.enable = false;
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
  obs.enable = true;
  bash.enable = true;
  doc.enable = true;
  fish.enable = true;
  fzf.enable = true;
  nu.enable = true;
  pager.enable = true;
  wofi.enable = true;
  fuzzel.enable = true;
  starship.enable = true;
  pet.enable = false; # candidate for cleaning
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
  # hyprland.enable = false;
  sway.enable = false; # candidate for cleaning
  wayland.enable = true;
  slack.enable = false; # candidate for cleaning
  picom.enable = false; # candidate for cleaning
  pinentry.enable = true;
  development.enable = true; # development and languages
  monitor.enable = true; # monitoring utilities
  insomnia.enable = false; # candidate for cleaning
  repos = {
    enable = true;
    notes.enable = true;
    prma.enable = true;
    algae.enable = true;
    webarchive.enable = true;
    prmadev.enable = true;
    amirographycom.enable = true;
    soapberry.enable = true;
  };

  nixpkgs.overlays = [
    inputs.neovim-nightly-overlay.overlay
    (final: prev: {zigpkg = inputs.zig.packages.${prev.system}.master;})
  ];
  home.packages = [inputs.kyushu.packages.${system}.kyushu];
}
