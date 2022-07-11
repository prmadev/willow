{
  pkgs,
  home,
  ...
}: {
  programs.rofi = {
    enable = true;
    font = "Recursive 10";
    theme = ./modules/launcher/rofi/rofi-pine.rasi;
  };
}
