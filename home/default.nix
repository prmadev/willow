{...}: {
  imports = [
    ./modules/browser
    ./modules/daily
    ./modules/development
    ./modules/environment
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
  ];
  gui.wm.enable = true;
  gui.browser.enable = true;
}
