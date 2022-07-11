{
  pkgs,
  hm,
  ...
}: {
  imports = [
    ./firefox
    ./qutebrowser
  ];
}
