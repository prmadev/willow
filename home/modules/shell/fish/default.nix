{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
with lib; {
  options = {
    fish.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
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
      interactiveShellInit = mkIf config.zellij.enable ''
        eval (zellij setup --generate-auto-start fish | string collect)
      '';
    };

    programs.fzf.enableFishIntegration =  true;
    programs.nix-index.enableFishIntegration = true;
    programs.starship.enableFishIntegration =  true;
    programs.zoxide.enableFishIntegration =  true;
    services.gpg-agent.enableFishIntegration = true;
    home.sessionVariables = {
      fish_greeting = "";
      fish_tmux_config =  "$HOME/.config/tmux/tmux.conf";
      fish_tmux_autoconnect =  "false";
    };
  };
}
