{
  pkgs,
  home,
  ...
}: {
  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.recursive;
      name = "Recursive Sans Linear";
      size = 10;
    };
    settings = {
      scrollback_lines = 15000;
      enable_audio_bell = false;
      update_check_interval = 0;
      repaint_delay = 10;
      input_delay = 1;
      sync_to_monitor = true;
      allow_remote_control = true;
    };
    theme = "Rosé Pine";
  };
}
