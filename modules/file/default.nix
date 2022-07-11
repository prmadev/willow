{
  pkgs,
  user,
  hm,
  ...
}: {
  hm.programs.broot.enable = true;

  hm.programs.fzf.enable = true;
  hm.zoxide.enable = true;
}
