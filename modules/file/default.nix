{
  pkgs,
  home-manager,
  ...
}: {
  home-manager.programs.broot.enable = true;

  home-manager.programs.fzf.enable = true;
  home-manager.zoxide.enable = true;
}
