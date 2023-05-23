{
  lib,
  config,
  inputs,
  ...
}:
with lib; {
  options.fish.enable = mkEnableOption "fish enable";

  config = mkIf config.fish.enable {
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
      interactiveShellInit = ''
        set -Ux FZF_DEFAULT_OPTS "\
        --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
        --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
        --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
      '';
    };

    # programs.fzf.enableFishIntegration = config.fzf.enable;
    programs.nix-index.enableFishIntegration = true;
    programs.starship.enableFishIntegration = config.starship.enable;
    # programs.zoxide.enableFishIntegration = config.zoxide.enable;
    services.gpg-agent.enableFishIntegration = config.gpg.enable;
    home.sessionVariables = {
      fish_greeting = "";
      fish_tmux_config = "$HOME/.config/tmux/tmux.conf";
      fish_tmux_autoconnect = "false";
    };
  };
}
