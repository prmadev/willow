{pkgs, ...}: {
  programs.git.enable = true;
  programs.git.delta.enable = true;
  programs.git.lfs.enable = true;

  programs.git.userEmail = "amirhossein.alesheikh@gmail.com";
  programs.git.userName = "amirography";

  programs.gh.enable = true;
  programs.gh.enableGitCredentialHelper = true;
  services.git-sync = {
    enable = true;
    repositories = {
      notes = {
        interval = 500;
        path = ~/path;
      };
    };
  };
}
