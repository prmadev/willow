{pkgs, ...}: {
  home-manager.home.packages = with pkgs; [
    gcc
  ];
}
