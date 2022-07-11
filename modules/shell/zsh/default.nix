{
  pkgs,
  home-manager,
  ...
}: {
  home-manager.programs.zsh.enable = true;
  home-manager.programs.zsh.enableAutosuggestions = true;
  home-manager.programs.zsh.enableCompletion = true;
  home-manager.programs.zsh.enableSyntaxHighlighting = true;
  home-manager.programs.zsh.enableVteIntegration = true;
  home-manager.programs.zsh.autocd = true;
  home-manager.programs.zsh.oh-my-zsh.enable = true;

  home-manager.programs.broot.enableZshIntegration = true;

  home-manager.programs.fzf.enableZshIntegration = true;

  home-manager.programs.just.enableZshIntegration = true;

  home-manager.programs.nix-index.enableZshIntegration = true;

  home-manager.programs.starship.enable = true;
  home-manager.programs.starship.enableZshIntegration = true;

  home-manager.programs.zoxide.enableZshIntegration = true;

  home-manager.services.gpg-agent.enableZshIntegration = true;
}
