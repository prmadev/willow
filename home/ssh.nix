{
  lib,
  config,
  ...
}:
with lib; {
  options.ssh.enable = mkEnableOption "ssh settings";

  config = mkIf config.ssh.enable {
    programs.ssh.enable = true;
  };
}
