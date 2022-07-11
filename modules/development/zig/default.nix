{
  pkgs,
  home,
  ...
}: {
  home.a.home.packages = with pkgs; [
    zig
  ];
}
