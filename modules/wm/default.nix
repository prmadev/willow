{
  pkgs,
  home,
  ...
}: {
  imports = [
    ./river
    ./waybar
  ];
}
