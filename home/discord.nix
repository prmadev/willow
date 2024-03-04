{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.discord.enable = mkEnableOption "discord settings";

  config = mkIf config.discord.enable {
    home.packages = with pkgs; [
      discord
      # discordo
    ];
  };
}
