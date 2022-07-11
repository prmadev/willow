{pkgs, ...}: {
  home-manager.nixosModules.home-manager.home.programs.broot.enable = true;

  home-manager.nixosModules.home-manager.home.programs.fzf.enable = true;
  home-manager.nixosModules.home-manager.home.zoxide.enable = true;
}
