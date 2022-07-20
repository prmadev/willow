{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options = {
    task = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };
  config = {
    programs.taskwarrior = mkIf config.task.enable {
      enable = true;

      colorTheme = "dark-16";

      config = {
        weekstart = "sunday";
        news.version = "2.6.0";
        taskd = {
          certificate = "$XDG_DATA_HOME/task/f.cert.pem";
          key = "$XDG_DATA_HOME/task/f.key.pem";
          ca = "$XDG_DATA_HOME/task/f.ca.pem";
          credentials = "FreeCinc/freecinc_499137bd/62ee954b-f363-4b26-908a-148023c2200c";
          server = "freecinc.com:53589";
        };

        color = {
          blocked = "color08";
          blockeding = "black on color8";
          blocking = "on color0";
          calendar.today = "bold white on bright green";
          error = "bold black on red";
          due.today = "bold color6";
          label = "bold color08";
        };
      };
    };

    home.packages = with pkgs;
      mkIf config.task.enable [
        tasksh
        taskopen
        taskwarrior-tui
      ];

    services.taskwarrior-sync = mkIf config.task.enable {
      enable = true;
    };
  };
}
