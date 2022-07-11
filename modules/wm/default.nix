{
  pkgs,
  hm,
  ...
}: {
  imports = [
    ./modules/wm/river
    ./modules/wm/waybar
  ];
}
