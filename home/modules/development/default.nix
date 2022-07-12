{pkgs, ...}: {
  imports = [
    ./build
    ./c
    ./css
    ./go
    ./git
    ./neovim
    ./nix
    ./rust
    ./zig
  ];
}
