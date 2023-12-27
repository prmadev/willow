{pkgs, ...}: {
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
    xdgOpenUsePortal = false;
    config = {
      common.default = "wlr";
    };

    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
  };

  programs.river = {
    enable = true;
    extraPackages = [];
  };
  programs.xwayland.enable = true;
}
