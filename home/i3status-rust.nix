{
  lib,
  config,
  ...
}:
with lib; {
  options.i3status-rust.enable = mkEnableOption "i3status-rust settings";
  config = mkIf config.i3status-rust.enable {
    programs.i3status-rust = {
      enable = true;
      bars = {
        default = {
          blocks = [
            {
              block = "sound";
            }
            {
              block = "time";
              format = " $timestamp.datetime(f:'%a %d/%m %R') ";
              interval = 1;
            }
          ];
          theme = "ctp-macchiato";
          icons = "material-nf";
        };
      };
    };
  };
}
