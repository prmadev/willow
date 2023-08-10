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
    ];
  };
}
