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
      {
        name = "tmux-fish";
        src = inputs.tmux-fish;
      }
    ];
    interactiveShellInit = ''
    '';
  };

  programs.fzf.enableFishIntegration = true;
  programs.nix-index.enableFishIntegration = true;
  programs.starship.enableFishIntegration = true;
  programs.zoxide.enableFishIntegration = true;
  services.gpg-agent.enableFishIntegration = true;
  home.sessionVariables = {
    fish_tmux_config = "$HOME/.config/tmux/tmux.conf";
    fish_greeting = "";
  };
}
