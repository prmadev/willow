{config, ...}: {
  imports = [
    ./boot
    ./graphical
    ./docker
    ./podman
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
