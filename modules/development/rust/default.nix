{
  pkgs,
  hm,
  ...
}: {
  hm.home.packages = with pkgs; [
    rustup
  ];
}
