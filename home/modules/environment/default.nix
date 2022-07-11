{pkgs, ...}: {
  # imports = [
  # ];

  services.gpg-agent.enable = true;
  fonts.fontconfig.enable = true;
  gtk.enable = true;
  # gtk.font.name = "Recursive";
  # gtk.font.package = pkgs.recursive;
  # gtk.font.size = 10;
  home.sessionPath = ["$HOME/.local/bin" "$HOME/go/bin" "$HOME/.cargo/bin"];
}
