{
  pkgs,
  home-manager,
  ...
}: {
  home-manager.packages = with pkgs; [
    rustup
  ];
}
