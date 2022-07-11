{pkgs, ...}: {
  home-manager.nixosModules.home-manager.home.programs.zsh.enable = true;
  home-manager.nixosModules.home-manager.home.programs.zsh.enableAutosuggestions = true;
  home-manager.nixosModules.home-manager.home.programs.zsh.enableCompletion = true;
  home-manager.nixosModules.home-manager.home.programs.zsh.enableSyntaxHighlighting = true;
  home-manager.nixosModules.home-manager.home.programs.zsh.enableVteIntegration = true;
  home-manager.nixosModules.home-manager.home.programs.zsh.autocd = true;
  home-manager.nixosModules.home-manager.home.programs.zsh.oh-my-zsh.enable = true;

  home-manager.nixosModules.home-manager.home.programs.broot.enableZshIntegration = true;

  home-manager.nixosModules.home-manager.home.programs.fzf.enableZshIntegration = true;

  home-manager.nixosModules.home-manager.home.programs.just.enableZshIntegration = true;

  home-manager.nixosModules.home-manager.home.programs.nix-index.enableZshIntegration = true;

  home-manager.nixosModules.home-manager.home.programs.starship.enable = true;
  home-manager.nixosModules.home-manager.home.programs.starship.enableZshIntegration = true;

  home-manager.nixosModules.home-manager.home.programs.zoxide.enableZshIntegration = true;

  home-manager.nixosModules.home-manager.home.services.gpg-agent.enableZshIntegration = true;
}
