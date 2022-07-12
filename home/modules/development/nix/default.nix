{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    niv
  ];

  programs.nix-index.enable = true;
}
