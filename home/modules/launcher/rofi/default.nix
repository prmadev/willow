{pkgs, ...}: {
  programs.rofi = {
    #TODO
    enable = true;
    font = "Recursive 10";
    theme = ./rofi-pine.rasi;
  };
}
