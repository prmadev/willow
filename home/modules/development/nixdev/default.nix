{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    nixdev.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.nixdev.enable {
    home.packages = with pkgs; [
      alejandra
      niv
      nix-prefetch
      nix-prefetch-git
      nix-doc
      nix-update
      nix-linter
      nix-template
      manix
      rnix-lsp
      deadnix
      patchelf
      nil
      nix-ld
      nix-top
      nix-tree
      nix-diff
      comma
      nixpkgs-lint
    ];

    programs.nix-index.enable = true;
  };
}
