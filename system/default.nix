{...}: {
  imports = [
    ./boot.nix
    ./graphical.nix
    ./docker.nix
    ./podman.nix
    ./fonts.nix
    ./hardware
    ./locale.nix
    ./nix.nix
    ./shell.nix
    ./users.nix
    ./network.nix
    ./database
  ];
  config.database.enable = true;
}
