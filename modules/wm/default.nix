{
  pkgs,
  home-manager,
  ...
}: {
  imports = [
    ./river
    ./waybar
  ];
}
