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
    ./css
    ./go
    ./git
    ./json
    ./neovim
    ./nixdev
    ./rust
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
    c.enable = true;
    css.enable = true;
    git.enable = true;
    go.enable = true;
    json.enable = true;
    neovim.enable = true;
    nixdev.enable = true;
    rust.enable = true;
    zig.enable = true;
  };
}
