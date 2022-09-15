{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options.picom.enable = mkOption {
    type = types.bool;
    default = false;
  };
  config = mkIf config.picom.enable {
    services.picom = {
      enable = true;
      package = pkgs.picom-next;
      backend = "xr_glx_hybrid";
      experimentalBackends = true;
      vSync = true;
    };
  };
}
