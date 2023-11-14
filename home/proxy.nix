{
  pkgs,
  lib,
  config,
  ...
}: let
  configData =
    pkgs.writeTextFile
    {
      name = "config.json";
      text = builtins.toJSON {
        "local_port" = 1080;
        "local_address" = "127.0.0.1";
      };
      destination = "";
    };
in
  with lib; {
    options.proxy.enable = mkEnableOption "proxy settings";

    config = mkIf config.proxy.enable {
      home.packages = [
        # pkgs.clash # for networking #TODO
        pkgs.shadowsocks-rust
        pkgs.proxychains-ng
        pkgs.chisel
        # inputs.stable.legacyPackages.${system}.v2ray
        pkgs.tun2socks
        # inputs.stable.legacyPackages.${system}.v2ray-geoip
        pkgs.xray
        # pkgs.shadowsocks-v2ray-plugin
        pkgs.tunctl
        pkgs.tor
        pkgs.arti
        pkgs.torsocks
        #pkgs.qv2ray
        pkgs.sshuttle
        pkgs.go-graft
        #pkgs.cloudflare-warp
      ];

      # home.file = {
      #   # ".config/shadowsocks/config.json" = {
      #   #   source = ./shadowsocks.json;
      #   # };
      # };

      home.file = {
        ".config/shadowsocks/config.json".source = configData;
        ".proxychains/proxychains.conf".source = ./proxychains.conf;
      };
    };
  }
