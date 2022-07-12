{pkgs, ...}: {
  home.packages = with pkgs; [
    nodePackages.tailwindcss
  ];
}
