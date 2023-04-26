{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options.picom.enable = mkEnableOption "picom settings";

  config = mkIf config.picom.enable {
    services.picom = {
      enable = true;
      package = pkgs.picom-next;
      backend = "xr_glx_hybrid";
      vSync = true;
    };
  };
}
