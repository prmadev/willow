{pkgs, ...}: {
  # imports = [
  # ];

  programs.gpg.enable = true;

  services.gpg-agent.enable = true;
  services.gpg-agent.enableSshSupport = true;
  services.gpg-agent.pinentryFlavor = "gtk2";

  programs.rbw.enable = true;
  programs.rbw.settings = {
    email = "amirhossein.alesheikh@gmail.com";
    pinentry = "gtk2";
  };

  fonts.fontconfig.enable = true;
  gtk.enable = true;
  gtk.theme = {
    package = pkgs.rose-pine-gtk-theme;
    name = "Rose Pine";
  };
  # gtk.font.name = "Recursive";
  # gtk.font.package = pkgs.recursive;
  # gtk.font.size = 10;
  home.packages = with pkgs; [
    mprocs
    pueue
    pinentry-gnome
    # font-manager # to see what the problem is with Dank Mono Bold
  ];

  home.sessionVariables = {
    BW_CLIENTSECRET = "1YnJyztT6fzD0mmvioFlq3jXoJ23Np";
    BW_SESSION = "l4fWgy4H9vCjf9LN8pmqWjfVdXRFrthUyP/KhSuww/AgxwTtkgWDQCwF/vTWOIc2rT9efPizQoJsKZ/kdKYaGQ==";
    PAGER = "less";
    XKB_DEFAULT_LAYOUT = "us,ir";
    XKB_DEFAULT_OPTIONS = "grp:alt_shift_toggle,caps:escape";
    QT_QPA_PLATFORM = "wayland";
    LESS = "-g -i -M -R -S -w -X -z-4";
    ZK_NOTEBOOK_DIR = "$HOME/notes";
    MOZ_ENABLE_WAYLAND = 1;
    FAVO_BOOKMARK = "$ZK_NOTEBOOK_DIR/bm.md";
  };
  home.sessionPath = ["$HOME/.local/bin" "go/bin" "$HOME/.cargo/bin"];
  xdg = {
    enable = true;
    mime.enable = true;
    mimeApps.enable = true;
    userDirs.enable = true;
    userDirs.createDirectories = true;
  };
}
