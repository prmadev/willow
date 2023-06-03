{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options.typst.enable = mkEnableOption "typst settings";
  config = mkIf config.typst.enable {
    home.packages = with pkgs; [
      typst
      typst-lsp
      typst-fmt
    ];
  };
}
