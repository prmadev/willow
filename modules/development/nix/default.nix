{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
  ];

  home.programs.nix-index.enable = true;
}
