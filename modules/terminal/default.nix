{
  pkgs,
  user,
  hm,
  ...
}: {
  imports = [
    ./modules/terminal/kitty
  ];
}
