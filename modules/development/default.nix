{
  pkgs,
  home,
  ...
}: {
  imports = [
    ./build
    ./c
    ./go
    ./neovim
    ./nix
    ./rust
    ./zig
  ];
}
