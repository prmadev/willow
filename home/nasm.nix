{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.nasm.enable = mkEnableOption "nasm settings";
  config = mkIf config.nasm.enable {
    home.package = with pkgs; [nasm];
  };
}
