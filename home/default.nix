{...}: {
  imports = [
    ./modules/browser
    ./modules/daily
    ./modules/development
    ./modules/security
    ./modules/file
    ./modules/hardware
    ./modules/launcher
    ./modules/network
    ./modules/shell
    ./modules/system
    ./modules/terminal
    ./modules/video
    ./modules/wayland
    ./modules/wm
    ./modules/style
    ./modules/monitor
  ];
  browser.enable = true; # web browsing
  daily.enable = true; # daily stuff
  development.enable = true; # development and languages
  file.enable = true; # development and languages
  monitor.enable = true; # monitoring utilities
  security.enable = true; # secerts
  style.enable = true;
  wm.enable = true; # window manager
  zellij.enable = true;
}
