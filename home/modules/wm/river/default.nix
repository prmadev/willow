{
  pkgs,
  home,
  ...
}: {
  home.packages = with pkgs; [
    river # my favorite window manager in wayland
  ]; #TODO make a more integrated configuration

  systemd.user.services.river = {
    Unit = {
      Description = "River daemon";
      After = "network.target";
    };

    Service = {
      Type = "simple";
      Restart = "always";
      ExecStart = "${pkgs.river}/bin/river";
    };
    Install = {
      WantedBy = ["multi-user.target"];
    };
  };
}
