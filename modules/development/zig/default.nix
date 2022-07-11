{pkgs, ...}: {
  home-manager.nixosModules.home-manager.home.a.home-manager.nixosModules.home-manager.home.packages = with pkgs; [
    zig
  ];
}
