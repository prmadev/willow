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
        default_shell = "fish";
        simplified_ui = true;
        pane_frames = false;
        scroll_buffer_size = 20000;
        scrollback_editor = "${pkgs.neovim}/bin/nvim";
        themes = {
          fg = "235,188,186";
        };
      };
    };
  };
}
