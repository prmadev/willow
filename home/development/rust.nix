{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.rust.enable = mkEnableOption "rust settings";

  config = mkIf config.rust.enable {
    home.packages = with pkgs; let
      cargoSubCommands = [
        cargo-cross
        cargo-geiger
        cargo-clone
        cargo-release
        cargo-vet
        cargo-pgx
        cargo-temp
        cargo-sort
        cargo-sweep
        cargo-audit
        cargo-auditable
        cargo-tarpaulin
        cargo-semver-checks
        cargo-udeps
        cargo-watch
        cargo-crev
        cargo-deny
        cargo-diet
        cargo-edit
        cargo-bloat
        cargo-about
        cargo-update
        cargo-readme
        cargo-release
        cargo-modules
        cargo-profiler
        cargo-outdated
        cargo-generate
        cargo-workspaces
        cargo-public-api
        cargo-supply-chain
        cargo-unused-features
      ];

      rustBasics = [
        # llvmPackages_latest.bintools
        # llvmPackages_latest.lld
        # llvmPackages_latest.llvm
        rustup
        cargo-binutils
      ];

      externalLibs = [
        glib
        grub2
        clang
        openssl
        qemu
        zlib.out
        xorriso
        pkg-config
      ];

      utils = [
        lldb
        mdbook
        # rust-analyzer
        taplo
        rusty-man
        rust-audit-info
        lapce
        rust-code-analysis
        trunk # for wasm
      ];
    in
      cargoSubCommands
      ++ rustBasics
      ++ externalLibs
      ++ utils;

    home.sessionPath = ["$HOME/.cargo/bin" "/$HOME/a/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin"];
  };
}
