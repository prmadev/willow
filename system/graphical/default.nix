{
  config,
  pkgs,
  ...
}: {
  # I don't want any stinky display manager :D
  services.xserver.displayManager.gdm.enable = false;
  services.xserver.displayManager.lightdm.enable = false;
  services.xserver.displayManager.sddm.enable = false;
  # programs.hyprland.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  programs.xwayland.enable = true;
}
