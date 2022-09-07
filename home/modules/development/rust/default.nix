{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    rust.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.rust.enable {
    home.packages = with pkgs; [
      lldb
      # rustup
      cargo
      rust-analyzer
      rustc
      rustfmt
      binutils
      clippy
    ];

    home.sessionPath = ["$HOME/.cargo/bin"];
  };
}
