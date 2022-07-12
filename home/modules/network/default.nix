{pkgs, ...}: {
  # imports = [./modules/];
  programs.aria2 = {
    enable = true;
    settings = {
      max-connection-per-server = 16;
      max-concurrent-downloads = 16;
      continue = true;
    };
  };
  programs.ssh.enable = true;
}
