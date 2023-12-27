{
  inputs,
  pkgs,
  config,
  ...
}: {
  imports = [
    ./deno.nix
    ./handlr.nix
    ./just.nix
    ./ollama.nix
    ./meli.nix
    ./hare.nix
    ./i3status-rust.nix
    ./notmuch.nix
    ./aerc.nix
    ./mbsync.nix
    ./hut.nix
    ./keychain.nix
    ./jitsi.nix
    ./tailwindcss.nix
    ./carapace.nix
    ./gitui.nix
    ./rustrover.nix
    ./beet.nix
    ./hugo.nix
    ./general.nix
    ./pantalaimon.nix
    ./soupault.nix
    ./element.nix
    ./build.nix
    ./direnv.nix
    ./go.nix
    ./git.nix
    ./neovim.nix
    ./helix
    ./emacs.nix
    ./leafslug.nix
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
    ./cinny.nix
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
    ./pandoc.nix
    ./asciidoc.nix
    ./repos.nix
    ./mako.nix
    ./zola.nix
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
    ./fluffychat.nix
    ./proxy.nix
    ./ssh.nix
    ./bw.nix
    ./gpg.nix
    # ./agenix.nix
    ./discord.nix
    ./wayland.nix
    ./monitor.nix
    ./pueue.nix
    ./monolith.nix
    ./jq.nix
    ./pls.nix
    ./iamb.nix
    ./yazi.nix
    ./lazygit.nix
    ./cliphist.nix
  ];
  just.enable = true;
  ollama.enable = true;
  notmuch.enable = true;
  aerc.enable = true;
  meli.enable = true;
  mbsync.enable = true;
  carapace.enable = false; # tests don't pass
  lazygit.enable = false;
  beet.enable = false; # tests don't pass
  panta.enable = false;
  iamb.enable = false;
  fluffychat.enable = false;
  yt-dlp.enable = true;
  jq.enable = true;
  monolith.enable = true;
  firefox.enable = true;
  qutebrowser.enable = false;
  tiny.enable = false;
  telegram.enable = true;
  discord.enable = true;
  exercism.enable = false;
  graphical.enable = true;
  task.enable = false;

  i3status-rust.enable = true;
  hoard.enable = false; # candidate for cleaning
  cinny.enable = true;
  zk.enable = false;
  gitui.enable = false;
  zola.enable = false;
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
  office.enable = true;
  ranger.enable = false;
  mpv.enable = true;
  pueue.enable = false;
  pdf.enable = true;
  rename.enable = true;
  xdgconf.enable = true;
  chrome.enable = true;
  atuin.enable = false;
  download.enable = true;
  proxy.enable = true;
  ssh.enable = true;
  general.enable = true;
  bw.enable = false;
  gpg.enable = true;
  # ragenix.enable = true;
  alias.enable = true;
  obs.enable = true;
  doc.enable = true;
  fzf.enable = true;

  bash.enable = true;
  fish.enable = true;
  nu.enable = true;
  zsh.enable = true;

  pager.enable = true;
  wofi.enable = false;
  fuzzel.enable = true;
  starship.enable = true;
  pet.enable = false; # candidate for cleaning
  font.enable = true;
  gtkconf.enable = true;
  zellij.enable = true;
  tmux.enable = true;
  wezterm.enable = true;
  foot.enable = true;
  kitty.enable = false;
  mako.enable = true;
  river.enable = true;
  eww.enable = false;
  sway.enable = true; # candidate for cleaning
  cliphist.enable = true;
  wayland.enable = true;
  slack.enable = false; # candidate for cleaning
  picom.enable = false; # candidate for cleaning
  pinentry.enable = true;
  build.enable = true;
  direnv.enable = true;
  git.enable = true;
  pandoc.enable = true;
  asciidoc.enable = false;

  neovim.enable = true;
  helix.enable = true;
  vscode.enable = false;
  emacs.enable = false;
  rust-rover.enable = false;
  datagrip.enable = false;

  elm.enable = false;
  go.enable = true;
  protobuf.enable = true;
  grpc.enable = true;
  nixdev.enable = true;
  rust.enable = true;
  zig.enable = false;
  haskell.enable = false;
  ocaml.enable = false;
  sql.enable = true;
  tailwindcss.enable = true;
  hare.enable = false;

  monitor.enable = true; # monitoring utilities
  insomnia.enable = false; # candidate for cleaning
  pls.enable = true;
  soup.enable = false;
  hugo.enable = true;

  brootFile.enable = false;
  nnn.enable = true;
  lf.enable = true;
  yazi.enable = true;

  leafslug.enable = true;
  element.enable = false;
  jitsi.enable = false;
  hut.enable = true;
  keychain.enable = true;
  deno.enable = true;

  handlr.enable = true;
  shell.user = "${pkgs.fish}/bin/fish";
  editor = {
    terminal = "${config.editor.helix.package}/bin/hx";
    helix.package = inputs.helix.packages.${pkgs.system}.default;
  };
  terminal = "${pkgs.foot}/bin/foot";
  launcher = "${pkgs.fuzzel}/bin/fuzzel";

  repos = {
    enable = true;
    notes.enable = true;
    prma.enable = true;
    algae.enable = false;
    webarchive.enable = true;
    prmadev.enable = true;
    amirographycom.enable = false;
    soapberry.enable = true;
    hxkeyboards.enable = false;
  };

  nixpkgs.overlays = [
    inputs.neovim-nightly-overlay.overlay
    (final: prev: {zigpkg = inputs.zig.packages.${prev.system}.master;})
  ];
}
