{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.lisp.enable = mkEnableOption "lisp settings";
  config = mkIf config.lisp.enable {
    home.packages = with pkgs; [sbcl roswell sbclPackages.qlot];
  };
}
