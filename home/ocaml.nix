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
      # ocaml.withPackages
      ocaml
      # (ps: [ps.ocaml-lsp ps.merlin ps.findlib ps.odoc ps.utop ps.ocamlformat ps.batteries ps.base ps.ounit2 ps.ocamlbuild])
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
      ocamlPackages.ounit2
      ocamlPackages.ocamlbuild
      ocamlPackages.base
    ];
  };
}
