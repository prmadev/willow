{
  pkgs,
  home-manager,
  ...
}: {
  imports = [
    ./firefox
    ./qutebrowser
  ];
}
