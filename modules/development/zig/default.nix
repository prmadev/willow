{pkgs, ...}: {
  home-manager.home.a.home-manager.home.packages = with pkgs; [
    zig
  ];
}
