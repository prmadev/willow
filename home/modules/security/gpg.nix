{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    gpg.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.gpg.enable {
    programs.gpg.enable = true;
    services.gpg-agent = {
      enable = true;
      enableSshSupport = true;
      pinentryFlavor = "gtk2";
    };
  };
}
