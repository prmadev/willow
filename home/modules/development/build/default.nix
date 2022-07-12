{pkgs, ...}: {
  programs.just.enable = true;
  home.packages = with pkgs; [
    make
  ];
}
