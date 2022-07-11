{
  pkgs,
  hm,
  ...
}: {
  hm.home.packages = with pkgs; [
    zig
  ];
}
