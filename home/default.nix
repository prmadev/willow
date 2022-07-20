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
  wm.enable = true; # window manager
  browser.enable = true; # web browsing
  daily.enable = true; # daily stuff
  development.enable = true; # development and languages
  file.enable = true; # development and languages
  security.enable = true; # secerts
  monitor.enable = true; # monitoring utilities
  style.enable = true;
}
