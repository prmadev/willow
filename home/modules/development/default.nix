{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  imports = [
    ./build
    ./c
    ./go
    ./git
    ./neovim
    ./helix
    ./nixdev
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
    git.enable = true;
    go.enable = true;
    neovim.enable = true;
    helix.enable = true;
    nixdev.enable = true;
    rust.enable = true;
    vscode.enable = true;
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
      redis
      # redis-desktop-manager
      iredis
      dfeet
      hyperfine
      # pgadmin
      ventoy-bin-full
    ];
  };
}
