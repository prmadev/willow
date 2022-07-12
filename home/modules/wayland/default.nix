{pkgs, ...}: {
  # imports = [./modules/];
  home.packages = with pkgs; [
    glib #for wayland gsettings
    river # my favorite window manager in wayland
    slurp # for wayland
    wl-clipboard
    clipman # for wayland
    brightnessctl
    grim # for wayland
    wtype
  ];
}
