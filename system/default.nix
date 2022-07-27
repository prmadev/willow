{config, ...}: {
  imports = [
    ./boot
    ./graphical
    ./fonts
    ./hardware
    ./locale
    ./nix
    ./shell
    ./users
    ./network
    ./database
  ];
  config.database.enable = true;
}
