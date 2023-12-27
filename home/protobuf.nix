{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options.protobuf.enable = mkEnableOption "protobuf settings";

  config = mkIf config.protobuf.enable {
    home.packages = with pkgs; [protobuf protoc-gen-rust protoc-gen-tonic protoc-gen-go-grpc protoc-gen-connect-go protoc-gen-grpc-web protoc-gen-rust-grpc go-protobuf buf-language-server buf protolint];
  };
}
