{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options.zellij = {
    enable = mkEnableOption "zellij setitngs";
    shell = mkOption {
      type = types.str;
      default = config.shell.user;
    };
    package = mkOption {
      type = types.package;
      default = config.multiplexer.zellij.package;
    };
  };

  config = mkIf config.zellij.enable {
    programs.zellij = {
      enable = true;
      package = config.zellij.package;
      settings = {
        default_shell = config.zellij.shell;
        simplified_ui = true;
        pane_frames = true;
        scroll_buffer_size = 200000;
        scrollback_editor = config.editor.terminal;
        ui.pane_frames.rounded_corners = true;
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
          unbind = ["Ctrl t"];
          normal = {
            "bind \"Alt t\"" = {
              SwitchToMode = "Tab";
            };
          };
        };
      };
      enableZshIntegration = false;
    };
  };
}
