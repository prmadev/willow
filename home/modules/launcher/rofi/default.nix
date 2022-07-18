{pkgs, ...}: {
  programs.rofi = {
    #TODO
    enable = true;
    font = "DankMono Nerd Font Mono 10";
    theme = ./rofi-pine.rasi;
    package = pkgs.rofi-wayland;
  };
  home.packages = with pkgs; [
    rofi-rbw # for password management
    # networkmanager_dmenu # needs dmenu to work
  ];
}
