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
    ./gnome.nix
    ./gpg.nix
    ./mullvad.nix
    ./redict.nix
    ./postgres.nix
  ];
}
