{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    font = "Recursive 10";
    theme = ./rofi-pine.rasi;
  };
}
