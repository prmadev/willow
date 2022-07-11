{
  pkgs,
  hm,
  ...
}: {
  imports = [
    ./modules/browsers/firefox
    ./modules/browsers/qutebrowser
  ];
}
