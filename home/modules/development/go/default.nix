{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    go.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.go.enable {
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
  };
}
