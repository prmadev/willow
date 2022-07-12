{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    niv
    nix-prefetch
    nix-prefetch-git
  ];

  programs.nix-index.enable = true;
}
