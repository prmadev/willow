{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.tailwindcss.enable = mkEnableOption "tailwindcss settings";
  config = mkIf config.tailwindcss.enable {
    home.packages = with pkgs; [
      tailwindcss
    ];
  };
}
