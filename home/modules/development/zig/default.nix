{pkgs, ...}: {
  a.home.packages = with pkgs; [
    zig
  ];
}
