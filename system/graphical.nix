_: {
  # I don't want any stinky display manager :D
  # services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm.enable = false;
  services.xserver.displayManager.lightdm.enable = false;
  services.xserver.displayManager.sddm.enable = false;
  services.xserver.displayManager.startx.enable = true;
  services.xserver.enable = true;
  # programs.hyprland.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  programs.xwayland.enable = true;
}
