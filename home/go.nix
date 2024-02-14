{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.go.enable = mkEnableOption "go settings";

  config = mkIf config.go.enable {
    programs.go = {
      enable = true;
      package = pkgs.go_1_21;
      packages = {
        # "golang.org/x/text" = builtins.fetchGit "https://go.googlesource.com/text";
      };
      goPath = "go";
      goPrivate = ["*github.com/asanbilit/*" "*gitlab.iranairs.com/*"];
    };

    home.packages = with pkgs; [
      # deadcode
      gofumpt
      golint
      richgo
      golangci-lint-langserver
      golangci-lint
      ent-go
      go-tools
      gopls
      godef
      gotools
      errcheck
      atlas
    ];

    home.sessionPath = ["$HOME/go/bin"];
  };
}
