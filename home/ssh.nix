{
  lib,
  config,
  ...
}:
with lib; {
  options.ssh.enable = mkEnableOption "ssh settings";

  config = mkIf config.ssh.enable {
    services.ssh-agent.enable = true;
    programs.ssh = {
      enable = true;
      matchBlocks = {
        asanbilit-ir-0 = {
          identitiesOnly = true;
          hostname = "46.245.64.96";
          identityFile = "~/.ssh/proton_id_ed25519";
          port = 65531;
          user = "amir";
        };
        uberspace = {
          identitiesOnly = true;
          hostname = "hamal.uberspace.de";
          user = "prmadev";
        };
        codeberg = {
          identitiesOnly = true;
          hostname = "git@codeberg.org";
          identityFile = "~/.ssh/id_ed25519";
          user = "prma";
        };
        gitlab = {
          identitiesOnly = true;
          hostname = "http://gitlab.iranairs.com/asanbilit/backend/asan-availability.git";
          identityFile = "~/.ssh/id_ed25519";
          user = "prma";
        };
      };
    };
  };
}
