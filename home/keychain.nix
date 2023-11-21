{
  lib,
  config,
  ...
}:
with lib; {
  options.keychain.enable = mkEnableOption "keychain settings";
  config = mkIf config.keychain.enable {
    programs.keychain = {
      enable = true;
      keys = ["id_ed25519" "proton_id_ed25519" "asanbilit"];
    };
  };
}
