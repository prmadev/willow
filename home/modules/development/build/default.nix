{pkgs, ...}: {
  # programs.just.enable = true; # cause problems with zsh!
  home.packages = with pkgs; [
    cmake
    just
    gnumake
  ];
}
