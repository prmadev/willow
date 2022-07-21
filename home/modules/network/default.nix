{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  imports = [
    ./download.nix
    ./proxy.nix
    ./ssh.nix
  ];
  options = {
    network.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.network.enable {
    download.enable = true;
    proxy.enable = true;
    ssh.enable = true;
  };
}
