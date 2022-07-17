{pkgs, ...}: {
  programs.rofi = {
    #TODO
    enable = true;
    font = "Recursive 10";
    theme = ./rofi-pine.rasi;
    package = pkgs.rofi-wayland.override {plugins = [pkgs.rofi-rbw];};
  };
  home.packages = with pkgs; [
    rofi-rbw # for password management
    # networkmanager_dmenu # needs dmenu to work
  ];
}
