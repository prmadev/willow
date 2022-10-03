{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    fzf.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.fzf.enable {
    programs = {
      fzf.enable = true;
      fzf.changeDirWidgetCommand = "fd --type d";
      fzf.tmux.enableShellIntegration = mkIf config.tmux.enable true;
    };
    home.packages = with pkgs; [
      fzf
      skim
    ];
  };
}
