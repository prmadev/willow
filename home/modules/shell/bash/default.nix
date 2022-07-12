{pkgs, ...}: {
  programs.starship.enableBashIntegration = true;
  programs.fzf.enableBashIntegration = true;
  programs.zoxide.enableBashIntegration = true;
  programs.just.enableBashIntegration = true;
}
