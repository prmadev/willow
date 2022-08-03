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
    rust.enable = true;
    vscode.enable = true;
    zig.enable = true;
  };
}
