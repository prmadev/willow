{
  pkgs,
  home-manager,
  ...
}: {
  home-manager.home.packages = with pkgs; [
    alejandra
  ];

  home-manager.programs.nix-index.enable = true;
}
