{pkgs, ...}: {
  programs.mako = {
    enable = true;
    anchor = "top-right";
    # textColor = "#285511FF" ;
    # backgroundColor = "#285511FF" ;
    # borderColor = "#285511FF" ;
    borderRadius = 0;
    borderSize = 0;
    defaultTimeout = 5000;
    font = "monospace 15";
    margin = "10";
    padding = "5";
    height = 100;
    witdth = 300;
  };
}
