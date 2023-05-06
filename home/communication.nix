{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.telegram.enable = mkEnableOption "telegram settings";

  config = mkIf config.telegram.enable {
    home.packages = with pkgs; [
      tdesktop
      discord
      discordo
    ];
  };
}
