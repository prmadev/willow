{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.js.enable = mkEnableOption "js settings";
  config = mkIf config.js.enable {
    home.packages = with pkgs; [
      nodePackages_latest.typescript-language-server
      tree-sitter
    ];
  };
}
