{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    protobuf.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.protobuf.enable {
    home.packages = with pkgs; [protobuf protoc-gen-rust go-protobuf buf-language-server];
  };
}
