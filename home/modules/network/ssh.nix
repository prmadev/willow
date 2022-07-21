{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    ssh.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.ssh.enable {
    programs.ssh.enable = true;
  };
}
