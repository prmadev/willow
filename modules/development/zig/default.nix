{
  pkgs,
  home-manager,
  ...
}: {
  home-manager.a.home.packages = with pkgs; [
    zig
  ];
}
