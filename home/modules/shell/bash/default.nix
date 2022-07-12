{pkgs, ...}: {
  programs.bash.enable = true;
  programs.bash = {
    enable = true;
    enableVteIntegration = true;
  };
  programs.starship.enableBashIntegration = true;
  programs.fzf.enableBashIntegration = true;
  programs.zoxide.enableBashIntegration = true;
  programs.just.enableBashIntegration = true;
  programs.nix-index.enableBashIntegration = true;
  programs.gpg-agent.enableBashIntegration = true;
}
