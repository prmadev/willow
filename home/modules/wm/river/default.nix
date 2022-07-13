{
  pkgs,
  home,
  ...
}: {
  home.packages = with pkgs; [
    river # my favorite window manager in wayland
  ]; #TODO make a more integrated configuration
}
