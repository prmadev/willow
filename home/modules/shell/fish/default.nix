{
  pkgs,
  inputs,
  ...
}: {
  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "fzf-fish";
        src = inputs.fzf-fish;
      }
      {
        name = "done-fish";
        src = inputs.done-fish;
      }
      {
        name = "sponge-fish";
        src = inputs.sponge-fish;
      }
    ];
  };

  programs.fzf.enableFishIntegration = true;
  programs.nix-index.enableFishIntegration = true;
  programs.starship.enableFishIntegration = true;
  programs.zoxide.enableFishIntegration = true;
  services.gpg-agent.enableFishIntegration = true;
}
