{pkgs, ...}: {
  home.a.home.packages = with pkgs; [
    zig
  ];
}
