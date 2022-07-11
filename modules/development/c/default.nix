{
  pkgs,
  hm,
  ...
}: {
  hm.home.packages = with pkgs; [
    gcc
  ];
}
