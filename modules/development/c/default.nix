{
  pkgs,
  home-manager,
  ...
}: {
  home-manager.home.packages = with pkgs; [
    gcc
  ];
}
