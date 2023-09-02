{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.elm.enable = mkEnableOption "elm settings";
  config = mkIf config.elm.enable {
    home.packages = with pkgs; [
      elmPackages.elm

      elmPackages.elm-analyse
      elmPackages.elm-verify-examples
      elmPackages.elm-doc-preview
      elmPackages.create-elm-app
      elmPackages.elm-optimize-level-2
      elmPackages.elm-language-server
      elmPackages.elm-live
      elmPackages.elm-review
      elmPackages.elm-json
      elmPackages.elm-format
      elmPackages.elm-upgrade
      elmPackages.elm-test-rs
      elmPackages.elm-xref
      elmPackages.elm-test
      elmPackages.elm-upgrade
      # haskellPackages.elm-package
      # haskellPackages.elm-get
    ];
  };
}
