{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    kitty.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.kitty.enable {
    programs.kitty = {
      enable = true;
      settings = {
        scrollback_lines = 15000;
        enable_audio_bell = false;
        update_check_interval = 0;
        repaint_delay = 10;
        input_delay = 1;
        sync_to_monitor = true;
        allow_remote_control = true;
        shell = "${pkgs.fish}/bin/fish";
        confirm_os_window_close = 0;
        font_family = "monospace";
        bold_font = "Gintronic Black";
        italic_font = "Gintronic Italic";
        bold_italic_font = "Gintronic Bold Italic ";
        font_size = 12;
      };
      theme = "Rosé Pine";
    };
  };
}
