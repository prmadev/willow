{
  pkgs,
  user,
  hm,
  ...
}: {
  hm.home.packages = with pkgs; [
    alejandra
  ];

  hm.programs.nix-index.enable = true;
}
