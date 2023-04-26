{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.go.enable = mkEnableOption;

  config = mkIf config.go.enable {
    programs.go = {
      enable = true;
      package = pkgs.go_1_20;
      packages = {
        # "golang.org/x/text" = builtins.fetchGit "https://go.googlesource.com/text";
      };
      goPath = "go";
    };

    home.packages = with pkgs; [
      richgo
      golangci-lint-langserver
    ];

    home.sessionPath = ["$HOME/go/bin"];
  };
}
