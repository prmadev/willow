{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options.fish.enable = mkEnableOption "fish enable";

  config = mkIf config.fish.enable {
    programs.fish = {
      enable = true;
      plugins = [
        {
          name = "fish-autopair";
          src = pkgs.fishPlugins.autopair;
        }
        {
          name = "fish-done";
          src = pkgs.fishPlugins.done;
        }
        {
          name = "fish-fzf";
          src = pkgs.fishPlugins.fzf;
        }
        {
          name = "fish-grc";
          src = pkgs.fishPlugins.grc;
        }
        {
          name = "fish-sponge";
          src = pkgs.fishPlugins.sponge;
        }
        {
          name = "fish-puffer";
          src = pkgs.fishPlugins.puffer;
        }
        {
          name = "fish-fzf-fish";
          src = pkgs.fishPlugins.fzf-fish;
        }
        {
          name = "fish-colored-man-pages";
          src = pkgs.fishPlugins.colored-man-pages;
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
