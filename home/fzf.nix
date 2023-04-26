{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.fzf.enable = mkEnableOption "fzf settings";

  config = mkIf config.fzf.enable {
    programs.fzf = {
      enable = true;
      changeDirWidgetCommand = "fd --type d";
      tmux.enableShellIntegration = mkIf config.tmux.enable true;
    };

    home.packages = with pkgs; [
      skim
    ];
  };
}
