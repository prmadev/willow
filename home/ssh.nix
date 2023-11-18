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
          identityFile = "~/.ssh/id_ed25519";
          port = 65531;
          user = "administrator";
        };
        codeberg = {
          identitiesOnly = true;
          hostname = "git@codeberg.org";
          identityFile = "~/.ssh/prma_id_ed25519";
          user = "prma";
        };
      };
    };
  };
}
