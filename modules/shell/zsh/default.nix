{
  pkgs,
  user,
  hm,
  ...
}: {
  hm.programs.zsh.enable = true;
  hm.programs.zsh.enableAutosuggestions = true;
  hm.programs.zsh.enableCompletion = true;
  hm.programs.zsh.enableSyntaxHighlighting = true;
  hm.programs.zsh.enableVteIntegration = true;
  hm.programs.zsh.autocd = true;
  hm.programs.zsh.oh-my-zsh.enable = true;

  hm.programs.broot.enableZshIntegration = true;

  hm.programs.fzf.enableZshIntegration = true;

  hm.programs.just.enableZshIntegration = true;

  hm.programs.nix-index.enableZshIntegration = true;

  hm.programs.starship.enable = true;
  hm.programs.starship.enableZshIntegration = true;

  hm.programs.zoxide.enableZshIntegration = true;

  hm.services.gpg-agent.enableZshIntegration = true;
}
