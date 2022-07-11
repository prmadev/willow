{
  pkgs,
  user,
  hm,
  ...
}: {
  hm.home.packages = with pkgs; [
    rustup
  ];
}
