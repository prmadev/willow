{
  lib,
  config,
  ...
}:
with lib; {
  imports = [
    ./build.nix
    ./direnv.nix
    ./go.nix
    ./git.nix
    ./neovim.nix
    ./helix
    ./haskell.nix
    ./nixdev.nix
    ./protobuf.nix
    ./grpc.nix
    ./rust.nix
    ./vscode.nix
    ./zig.nix
  ];

  options.development.enable = mkEnableOption "development options";

  config = mkIf config.development.enable {
    build.enable = true;
    direnv.enable = true;
    git.enable = true;
    go.enable = true;
    neovim.enable = true;
    protobuf.enable = true;
    grpc.enable = true;
    helix.enable = true;
    nixdev.enable = true;
    rust.enable = true;
    vscode.enable = false;
    zig.enable = false;
    haskell.enable = true;
  };
}
