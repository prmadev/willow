{pkgs, ...}: {
  imports = [
    ./firefox
    ./qutebrowser
    # ./chromium
  ];
  home.file = {
    ".config/startpage/" = {
      source = ./startpage;
      recursive = true;
    };
  };
}
