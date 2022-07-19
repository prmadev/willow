{pkgs, ...}: {
  programs.fish = {
    enable = true;
  };

  programs.fzf.enableFishIntegration = true;
  programs.nix-index.enableFishIntegration = true;
  programs.starship.enableFishIntegration = true;
  programs.zoxide.enableFishIntegration = true;
  services.gpg-agent.enableFishIntegration = true;
}
