_: {
  # I don't want any stinky display manager :D
  services.xserver.desktopManager.gnome.enable = false;
  # services.xserver.displayManager.gdm.enable = false;
  services.xserver.displayManager.lightdm.enable = false;
  services.xserver.displayManager.sddm.enable = false;
  services.xserver.displayManager.startx.enable = false;
  services.xserver.enable = false;
  # programs.hyprland.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  programs.river.enable = true;
  programs.xwayland.enable = true;
}
