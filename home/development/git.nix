{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options.git.enable = mkEnableOption "git settings";

  config = mkIf config.git.enable {
    home.packages = with pkgs; [
      git-gone # trim stale branches
      git-bug # bug reporting right inside the repo
    ];

    programs.git = {
      enable = true;
      userEmail = "amirhossein.alesheikh@gmail.com";
      userName = "amirography";
      ignores = [
        ".env"
        ".vscode"
      ];
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
      };
      signing = {
        key = "EA109402685DDDDB";
        signByDefault = true;
      };

      delta.enable = true;
      lfs.enable = true;
    };

    programs.gh = {
      enable = true;
      enableGitCredentialHelper = true;
      extensions = [
        pkgs.gh-dash
        pkgs.gh-eco
        # gh-poi # not yet available
        pkgs.gh-cal
        pkgs.gh-markdown-preview
      ];
    };
  };
}
