{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.niri.enable = mkEnableOption "niri settings";
  config = mkIf config.niri.enable {
    systemd.user.services.niri-flake-polkit.Service = {
      #   # Type = "simple";
      # ExecStart = "echo 'hello'";

      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    };
    programs.niri = {
      # enable = true;
    };
    systemd.user.services = {
      swaybg = {
        Unit = {
          PartOf = "graphical-serssion.target";
          After = "graphical-session.target";
          Requisite = "graphical-session.target";
        };
        Service = {
          ExecStart = "${pkgs.swaybg}/bin/swaybg -c \"#232136\"";
          Restart = "on-failure";
        };
      };
      waybar-niri = {
        Unit = {
          PartOf = "graphical-serssion.target";
          After = "graphical-session.target";
          Requisite = "graphical-session.target";
        };
        Service = {
          ExecStart = "${pkgs.waybar}/bin/waybar";
          Restart = "on-failure";
        };
      };
    };
  };
}
