{pkgs, ...}: {
  home.packages = with pkgs; [
    nodePackages.tailwindcss
    nodePackages.npm

    nodejs
    python3
    python310Packages.python-socks
  ];
}
