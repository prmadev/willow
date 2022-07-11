{
  pkgs,
  home-manager,
  ...
}: {
  home-manager.packages = with pkgs; [
    alejandra
  ];

  home-manager.programs.nix-index.enable = true;
}
