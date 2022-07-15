{pkgs, ...}: {
  imports = [
    ./firefox
    ./qutebrowser
  ];
  home.file = {
    ".config/startpage/" = {
      source = ./startpage;
      recursive = true;
    };
  };
}
