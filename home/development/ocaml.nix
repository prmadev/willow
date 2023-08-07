{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.ocaml.enable = mkEnableOption "ocaml settings";

  config = mkIf config.ocaml.enable {
    home.packages = with pkgs; [
      ocaml
      ocamlPackages.ocaml-lsp
      opam
      dune_3
      dune-release
      ocamlPackages.merlin
      ocamlPackages.findlib
      ocamlPackages.odoc
      ocamlPackages.utop
      ocamlPackages.ocamlformat
      ocamlPackages.batteries

      ocamlPackages.ocamlbuild
    ];
  };
}
