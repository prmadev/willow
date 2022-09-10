{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  imports = [
    ./api
    ./build
    ./c
    ./css
    ./go
    ./git
    ./json
    ./neovim
    ./helix
    ./jetbrains
    ./nixdev
    ./rust
    ./efm
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
    api.enable = true;
    build.enable = true;
    c.enable = true;
    css.enable = true;
    git.enable = true;
    go.enable = true;
    json.enable = true;
    neovim.enable = true;
    helix.enable = true;
    nixdev.enable = true;
    goland.enable = true;
    rust.enable = true;
    vscode.enable = true;
    zig.enable = true;
    efm.enable = true;

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
    ];
  };
}
