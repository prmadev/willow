{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  imports = [
    ./build
    # ./emacs
    ./c
    ./env
    ./go
    ./git
    ./neovim
    ./helix
    ./nixdev
    ./protobuf.nix
    ./grpc.nix
    ./rust
    ./vscode
    ./zig
  ];
  options = {
    development.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.development.enable {
    build.enable = true;
    c.enable = false;
    env.enable = true;
    git.enable = true;
    go.enable = true;
    neovim.enable = true;
    protobuf.enable = true;
    grpc.enable = true;
    # emacs.enable = false;
    helix.enable = true;
    nixdev.enable = true;
    rust.enable = true;
    vscode.enable = false;
    zig.enable = true;

    home.packages = with pkgs; [
      # flutter
      # dart
      # gtk3
      # cairo
      # pango
      # atk
      # glib
      # libepoxy
      # redis
      # redis-desktop-manager
      # iredis
      dfeet
      hyperfine
      # pgadmin
      ventoy-bin-full
      hurl
      jq
      nodePackages.npm
      nodejs
    ];
  };
}
