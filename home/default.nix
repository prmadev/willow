{
  inputs,
  pkgs,
  config,
  ...
}: {
  imports = [
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
    ./prmait.nix
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
  notmuch.enable = true;
  aerc.enable = true;
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
  bw.enable = false;
  gpg.enable = true;
  # ragenix.enable = true;
  alias.enable = true;
  obs.enable = true;
  bash.enable = true;
  doc.enable = true;
  fish.enable = true;
  fzf.enable = true;
  nu.enable = true;
  pager.enable = true;
  wofi.enable = false;
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
  sway.enable = true; # candidate for cleaning
  cliphist.enable = true;
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
  pandoc.enable = true;
  asciidoc.enable = false;
  neovim.enable = true;
  protobuf.enable = true;
  grpc.enable = true;
  helix.enable = true;
  nixdev.enable = true;
  rust.enable = true;
  vscode.enable = false;
  zig.enable = false;
  haskell.enable = false;
  ocaml.enable = true;
  sql.enable = true;
  emacs.enable = false;
  monitor.enable = true; # monitoring utilities
  insomnia.enable = false; # candidate for cleaning
  pls.enable = true;
  soup.enable = false;
  hugo.enable = true;
  yazi.enable = true;
  prmait.enable = true;
  rust-rover.enable = false;
  element.enable = false;
  jitsi.enable = false;
  tailwindcss.enable = true;
  hut.enable = true;
  hare.enable = false;
  keychain.enable = true;

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
  # home.packages = [inputs.kyushu.packages.${system}.kyushu];
}
