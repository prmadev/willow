{
  inputs,
  system,
  pkgs,
  config,
  ...
}: {
  imports = [
    ./general.nix
    ./build.nix
    ./direnv.nix
    ./go.nix
    ./git.nix
    ./neovim.nix
    ./helix
    ./pref.nix
    ./haskell.nix
    ./nixdev.nix
    ./protobuf.nix
    ./grpc.nix
    ./rust.nix
    ./vscode.nix
    ./zig.nix
    ./ocaml.nix
    ./datagrip.nix
    ./sql.nix
    ./elm.nix
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
    ./sway.nix
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
    ./monitor.nix
    ./pueue.nix
    ./monolith.nix
    ./jq.nix
    ./pls.nix
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
  sway.enable = false; # candidate for cleaning
  wayland.enable = true;
  slack.enable = false; # candidate for cleaning
  picom.enable = false; # candidate for cleaning
  pinentry.enable = true;
  datagrip.enable = false;
  elm.enable = false;
  build.enable = true;
  direnv.enable = true;
  git.enable = true;
  go.enable = true;
  neovim.enable = true;
  protobuf.enable = true;
  grpc.enable = true;
  helix.enable = true;
  nixdev.enable = true;
  rust.enable = true;
  vscode.enable = false;
  zig.enable = true;
  haskell.enable = false;
  ocaml.enable = false;
  sql.enable = true;
  monitor.enable = true; # monitoring utilities
  insomnia.enable = false; # candidate for cleaning
  pls.enable = true;

  shell.user = "${pkgs.fish}/bin/fish";
  editor = {
    terminal = "${config.editor.helix.package}/bin/hx";
    helix.package = inputs.helix.packages.${pkgs.system}.default;
  };

  terminal = "${pkgs.foot}/bin/foot";
  repos = {
    enable = true;
    notes.enable = true;
    prma.enable = true;
    algae.enable = true;
    webarchive.enable = true;
    prmadev.enable = true;
    amirographycom.enable = true;
    soapberry.enable = true;
    hxkeyboards.enable = true;
  };

  nixpkgs.overlays = [
    inputs.neovim-nightly-overlay.overlay
    (final: prev: {zigpkg = inputs.zig.packages.${prev.system}.master;})
  ];
  home.packages = [inputs.kyushu.packages.${system}.kyushu];
}
