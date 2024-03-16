{
  lib,
  config,
  ...
}:
with lib; {
  options.browserpass.enable = mkEnableOption "browserpass settings";
  config = mkIf config.browserpass.enable {
    programs.browserpass = {
      enable = true;
    };
  };
}
