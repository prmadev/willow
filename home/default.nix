{...}: {
  imports = [
    ./modules/browser
    ./modules/daily
    ./modules/development
    ./modules/file
    ./modules/hardware
    ./modules/launcher
    ./modules/monitor
    ./modules/network
    ./modules/security
    ./modules/shell
    ./modules/style
    ./modules/terminal
    ./modules/wayland
    ./modules/wm
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
  terminal.enable = true;
  wm.enable = true; # window manager
}
