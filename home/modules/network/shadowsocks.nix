{pkgs, ...}: let
  configData = {
    "local_port" = 100;
    "local_address" = "127.0.0.1";
  };
in
  pkgs.nixago.lib.make {
    inherit configData;
    output = "~/.config/shadowsocks/shadowsocks.json";
    format = "json";
  }
