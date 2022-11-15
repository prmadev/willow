{ pkgs
, lib
, config
, inputs
, ...
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
      inputs.nix-alien.packages.${system}.nix-alien
      # nix-index-update
      inputs.nixme.packages.${system}.default
    ];

    programs.nix-index.enable = true;
  };
}
