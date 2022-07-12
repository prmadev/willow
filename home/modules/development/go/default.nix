{pkgs, ...}: {
  programs.go = {
    enable = true;
    package = pkgs.go_1_18;
    packages = {
      # "golang.org/x/text" = builtins.fetchGit "https://go.googlesource.com/text";
    };
  };
  home.packages = with pkgs; [
    gomod2nix
    tinygo
  ];
}
