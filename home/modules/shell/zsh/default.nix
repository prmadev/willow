{pkgs, ...}: {
  programs.zsh.enable = true;
  programs.zsh.enableAutosuggestions = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.enableSyntaxHighlighting = true;
  programs.zsh.enableVteIntegration = true;
  programs.zsh.autocd = true;
  # programs.zsh.oh-my-zsh.enable = true;
  programs.zsh.prezto.enable = true;

  #
  # programs.broot.enableZshIntegration = true;

  programs.fzf.enableZshIntegration = true;

  programs.just.enableZshIntegration = true;

  programs.nix-index.enableZshIntegration = true;

  programs.starship.enableZshIntegration = true;

  programs.zoxide.enableZshIntegration = true;

  services.gpg-agent.enableZshIntegration = true;
}
