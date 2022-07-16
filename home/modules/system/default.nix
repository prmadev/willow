{pkgs, ...}: {
  programs.bottom.enable = true;
  programs.htop.enable = true;
  home.packages = with pkgs; [
    procs
    gparted
    bunnyfetch
    onefetch
macchina
  ];
}
