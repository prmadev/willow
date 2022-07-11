{pkgs, ...}: {
  home-manager.nixosModules.home-manager.home.packages = with pkgs; [
    alejandra
  ];

  home-manager.nixosModules.home-manager.home.programs.nix-index.enable = true;
}
