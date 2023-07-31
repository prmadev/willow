{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.haskell.enable = mkEnableOption "haskell settings";

  config = mkIf config.haskell.enable {
    home.packages = with pkgs; [
      # haskell-language-server.override {supportedGhcVersions = ["927" "928" "945"];}
      (haskellPackages.ghcWithHoogle (hpkgs:
        with hpkgs; [
          # ghcup
          stack
          cabal-install
          cabal-fmt

          # Linter and formatters
          hlint
          # brittany
          ormolu
          fourmolu

          fast-tags
          hasktags
          haskell-language-server
        ]))
    ];
  };
}
