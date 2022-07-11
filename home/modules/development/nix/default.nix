{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
  ];

  programs.nix-index.enable = true;
}
