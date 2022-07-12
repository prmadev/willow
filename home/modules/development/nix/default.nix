{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    niv
    nix-prefetch
  ];

  programs.nix-index.enable = true;
}
