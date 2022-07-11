{pkgs, ...}: {
  home-manager.nixosModules.home-manager.home.packages = with pkgs; [
    rustup
  ];
}
