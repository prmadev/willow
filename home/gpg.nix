{
  lib,
  config,
  ...
}:
with lib; {
  options.gpg.enable = mkEnableOption "gpg settings";

  config = mkIf config.gpg.enable {
    programs.gpg.enable = true;

    services.gpg-agent = {
      enable = true;
      enableSshSupport = true;
      pinentryFlavor = "gtk2";
    };
  };
}
