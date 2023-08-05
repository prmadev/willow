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
    ];
  };
}
