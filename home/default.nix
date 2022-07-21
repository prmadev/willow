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
  hardware.enable = true;
  monitor.enable = true; # monitoring utilities
  network.enable = true;
  security.enable = true; # secerts
  shell.enable = true;
  style.enable = true;
  wm.enable = true; # window manager
  zellij.enable = true;
}
