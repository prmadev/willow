{pkgs, ...}: {
  programs.go = {
    enable = true;
    package = pkgs.go_1_18;
    packages = {
      # "golang.org/x/text" = builtins.fetchGit "https://go.googlesource.com/text";
    };
    goPath = "go";
  };
  home.packages = with pkgs; [
    tinygo
    richgo
  ];
}
