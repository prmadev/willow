{
  pkgs,
  home,
  ...
}: {
  home.programs.zsh.enable = true;
  home.programs.zsh.enableAutosuggestions = true;
  home.programs.zsh.enableCompletion = true;
  home.programs.zsh.enableSyntaxHighlighting = true;
  home.programs.zsh.enableVteIntegration = true;
  home.programs.zsh.autocd = true;
  home.programs.zsh.oh-my-zsh.enable = true;

  home.programs.broot.enableZshIntegration = true;

  home.programs.fzf.enableZshIntegration = true;

  home.programs.just.enableZshIntegration = true;

  home.programs.nix-index.enableZshIntegration = true;

  home.programs.starship.enable = true;
  home.programs.starship.enableZshIntegration = true;

  home.programs.zoxide.enableZshIntegration = true;

  home.services.gpg-agent.enableZshIntegration = true;
}
