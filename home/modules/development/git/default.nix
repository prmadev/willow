{
  pkgs,
  lib,
  config,
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
    programs.git.enable = true;
    programs.git.delta.enable = true;
    programs.git.lfs.enable = true;

    programs.git.userEmail = "amirhossein.alesheikh@gmail.com";
    programs.git.userName = "amirography";

    programs.gh.enable = true;
    programs.gh.enableGitCredentialHelper = true;
    home.packages = with pkgs; [
      onefetch
    ];
  };
}
