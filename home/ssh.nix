{
  lib,
  config,
  ...
}:
with lib; {
  options.ssh.enable = mkEnableOption "ssh settings";

  config = mkIf config.ssh.enable {
    programs.ssh = {
      enable = true;
      matchBlocks = {
        "git.jafam.ir" = {
          identityFile = [".ssh/github"];
          host = "git.jafam.ir";
          user = "amir.al";
        };
      };
    };
  };
}
