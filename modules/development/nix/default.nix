{pkgs, ...}: {
  home-manager.home.packages = with pkgs; [
    alejandra
  ];

  home-manager.home.programs.nix-index.enable = true;
}
