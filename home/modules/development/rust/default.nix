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
      # cargo
      rust-analyzer
      # rustc
      # rustfmt
      cargo-binutils
      # clippy
      # rls
      rust-code-analysis
      cargo-geiger
      # binutils
      glib
      rustup
      # gcc
      # clang
      # llvmPackages_latest.bintools
      llvmPackages_latest.llvm
      llvmPackages_latest.lld
      # libvmi
      zlib.out
      xorriso
      mdbook
      cargo-cross
    ];

    home.sessionPath = ["$HOME/.cargo/bin" "/$HOME/a/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin"];
  };
}
