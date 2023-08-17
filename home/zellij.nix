{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options.zellij.enable = mkEnableOption "zellij setitngs";

  config = mkIf config.zellij.enable {
    programs.zellij = {
      enable = true;
      # package = inputs.zellij;
      settings = {
        default_shell = "fish";
        simplified_ui = false;
        pane_frames = true;
        scroll_buffer_size = 20000;
        scrollback_editor = "${pkgs.helix}/bin/hx";
        ui.pane_frames.rounded_corners = false;
        copy_command = "wl-copy";
        theme = "catppuccin-macchiato";
        themes = {
          catppuccin-macchiato = {
            fg = config.colors.macchiato.subtext0.hex;
            bg = config.colors.macchiato.base.hex;
            black = config.colors.macchiato.mantle.hex;
            red = config.colors.macchiato.red.hex;
            green = config.colors.macchiato.green.hex;
            yellow = config.colors.macchiato.yellow.hex;
            blue = config.colors.macchiato.blue.hex;
            magenta = config.colors.macchiato.mauve.hex;
            cyan = config.colors.macchiato.teal.hex;
            white = config.colors.macchiato.text.hex;
            orange = config.colors.macchiato.peach.hex;
          };
        };
        keybinds = {
          normal = {
          };
        };
      };
      enableZshIntegration = false;
    };
    # home.packages = with pkgs; [skim];
  };
}
