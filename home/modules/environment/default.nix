{pkgs, ...}: {
  # imports = [
  # ];

  services.gpg-agent.enable = true;
  fonts.fontconfig.enable = true;
  gtk.enable = true;
  gtk.font.name = "Recursive";
  gtk.font.package = pkgs.Recursive;
  gtk.font.size = 10;
  home.keyboard.layout = "us, fa";
  home.keyboard.options = ["grp:alt_shift_toggle"];
}
