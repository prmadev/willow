{config, ...}: {
  imports = [
    ./boot
    ./graphical
    ./docker
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
