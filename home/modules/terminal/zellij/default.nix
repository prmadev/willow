{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options = {
    zellij.enable =
      mkOption {
      };
  };
  config = mkIf config.zellij.enable {
    programs.zellij = {
      enable = true;
      settings = {
        default_shell = "zsh";
        simplified_ui = true;
        pane_frames = true;
        scroll_buffer_size = 20000;
        scrollback_editor = "${pkgs.helix}/bin/hx";
        copy_command = "wl-copy";
        themes = {
          default = {
            fg = config.colors.text.rgb;
            bg = config.colors.base.rgb;
            black = config.colors.surface.rgb;
            red = config.colors.love.rgb;
            green = config.colors.pine.rgb;
            yellow = config.colors.gold.rgb;
            blue = config.colors.foam.rgb;
            magenta = config.colors.iris.rgb;
            cyan = config.colors.rose.rgb;
            white = config.colors.subtle.rgb;
            orange = config.colors.gold.rgb;
          };
        };
      };
    };
    home.packages = with pkgs; [skim];
  };
}
