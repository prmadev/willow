{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options = {
    git.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.git.enable {
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

      delta.enable = true;
      lfs.enable = true;
    };

    programs.gh = {
      enable = true;
      enableGitCredentialHelper = true;
      extensions = with pkgs; [
        gh-dash
        gh-eco
        # gh-poi # not yet available
        gh-cal
        gh-markdown-preview
      ];
    };
  };
}
