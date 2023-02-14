{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    grpc.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.grpc.enable {
    home.packages = with pkgs; [grpcurl];
  };
}
