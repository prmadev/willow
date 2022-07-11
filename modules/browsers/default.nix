{
  pkgs,
  home,
  ...
}: {
  imports = [
    ./firefox
    ./qutebrowser
  ];
}
