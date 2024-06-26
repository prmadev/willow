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
        cargo-features-manager
        cargo-wizard
        cargo-shear
        cargo-cross
        # cargo-geiger
        cargo-clone
        cargo-release
        cargo-vet
        # cargo-pgx
        cargo-shuttle
        cargo-temp
        cargo-shuttle
        cargo-sort
        cargo-sweep
        cargo-audit # libgit2
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
        # cargo-modules
        cargo-profiler
        cargo-outdated
        cargo-generate
        cargo-workspaces
        cargo-public-api
        cargo-supply-chain
        cargo-unused-features #libgit2
        cargo-nextest
        cargo-leptos
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
        # qemu
        zlib.out
        xorriso
        pkg-config
      ];

      utils = [
        mold
        lld_16
        lldb
        mdbook
        # rust-analyzer
        taplo
        rusty-man
        bacon
        rust-audit-info
        lapce
        rust-code-analysis
        trunk # for wasm
        sea-orm-cli
        sqlx-cli
        bunyan-rs
        rust-script
        sqlite
        diesel-cli
        valgrind
        loco-cli
      ];
    in
      cargoSubCommands
      ++ rustBasics
      ++ externalLibs
      ++ utils;

    home.sessionVariables = {
      PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
      RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
    };
    home.sessionPath = ["$HOME/.cargo/bin" "/$HOME/a/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin"];
  };
}
