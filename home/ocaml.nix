{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.ocaml.enable = mkEnableOption "ocaml settings";

  config = mkIf config.ocaml.enable {
    programs.opam = {
      enable = true;
    };
    home.packages = with pkgs; [
      # ocaml.withPackages
      # ocaml

      # ocaml_5
      # opam
      # (ps: [ps.ocaml-lsp ps.merlin ps.findlib ps.odoc ps.utop ps.ocamlformat ps.batteries ps.base ps.ounit2 ps.ocamlbuild])

      ocaml-ng.ocamlPackages_5_1.ocaml
      ocaml-ng.ocamlPackages_5_1.astring
      ocaml-ng.ocamlPackages_5_1.findlib
      ocaml-ng.ocamlPackages_5_1.ocamlgraph

      ocaml-ng.ocamlPackages_5_1.ocaml-compiler-libs
      ocaml-ng.ocamlPackages_5_1.ocaml-lsp
      ocaml-ng.ocamlPackages_5_1.core
      ocaml-ng.ocamlPackages_5_1.core_extended
      dune_3
      # dune-release
      ocaml-ng.ocamlPackages_5_1.merlin
      ocaml-ng.ocamlPackages_5_1.findlib
      ocaml-ng.ocamlPackages_5_1.qcheck
      ocaml-ng.ocamlPackages_5_1.bisect_ppx
      ocaml-ng.ocamlPackages_5_1.menhir
      ocaml-ng.ocamlPackages_5_1.ocamlformat

      ocaml-ng.ocamlPackages_5_1.odoc
      ocaml-ng.ocamlPackages_5_1.utop
      ocaml-ng.ocamlPackages_5_1.ocamlformat
      ocaml-ng.ocamlPackages_5_1.batteries
      # ocaml-ng.ocamlPackages_5_1.ounit2
      ocaml-ng.ocamlPackages_5_1.ocamlbuild
      ocaml-ng.ocamlPackages_5_1.base
    ];

    programs.fish.interactiveShellInit = ''
    '';
  };
}
