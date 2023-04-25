{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options = {
    tmux.enable = mkEnableOption "tmux";
    tmux.autorun = mkEnableOption "autorun tmux";
  };
  config = mkIf config.tmux.enable {
    programs.tmux = {
      enable = true;
      terminal = "tmux-256color";
      historyLimit = 10000;
      escapeTime = 0;
      mouse = true;
      shell = "${pkgs.zsh}/bin/zsh";
      sensibleOnTop = true;
      keyMode = "vi";
      prefix = "C-Space";
      extraConfig = let
        nextToggle = ''bind-key  -n C-\\ next-window'';
        killSession = ''bind-key   C-k kill-session'';
        horPane = ''bind | split-window -h -c "#{pane_current_path}"'';
        verPane = ''bind - split-window -v -c "#{pane_current_path}"'';
        newWin = ''bind c new-window -c "#{pane_current_path}"'';
        newPrefix = ''bind C-Space send-prefix'';
        willowBinding = ''bind -n M-w new-session -A -s willow "smug willow -a"'';
      in
        builtins.concatStringsSep "\n" [nextToggle horPane verPane newWin killSession newPrefix willowBinding];

      plugins = with pkgs; [
        tmuxPlugins.open
        {
          plugin = tmuxPlugins.tmux-fzf;
          extraConfig = ''TMUX_FZF_LAUNCH_KEY="C-f"'';
        }
        {
          plugin = tmuxPlugins.catppuccin;
          extraConfig = "set -g @catppuccin_flavour 'macchiato'\n" + "set -g @catppuccin_window_tabs_enabled on" + "\n";
        }
        {
          plugin = tmuxPlugins.yank;
          extraConfig = let
            beginSelection = "bind-key -T copy-mode-vi v send-keys -X begin-selection";
            rectangleToggle = "bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle";
            copySelectionAndCancel = "bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel";
          in
            builtins.concatStringsSep "\n" [beginSelection rectangleToggle copySelectionAndCancel];
        }
        tmuxPlugins.tmux-thumbs
      ];
    };
    home.packages = with pkgs; [
      smug
    ];
    home.file = {
      "soapberrya.yml" = with lib; {
        enable = true;
        text = let
          soapberry = {
            session = "soapberry ";
            root = "~/kapa/pro/soapberry";
            windows = [
              {
                name = " code";
                commands = ["hx ."];
                layout = "main-horizontal";
              }
            ];
          };
        in (generators.toYAML {} soapberry);
        target = ".config/smug/soapberrya.yml";
      };
    };
  };
}
