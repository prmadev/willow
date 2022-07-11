{
  pkgs,
  user,
  hm,
  ...
}: {
  imports = [
    ./modules/browsers/firefox
    ./modules/browsers/qutebrowser
  ];
}
