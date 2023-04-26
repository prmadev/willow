{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.general.enable = mkEnableOption "general packages";

  config = mkIf config.general.enable {
    home.packages = with pkgs; [
      gcc
      # clang
      cmake
      pkg-config
      openssl_3
      musl

      gum

      calibre
      mprocs # not a monitoring tool
      zola
      d2
      zk
      jql
      trashy
      dig.dnsutils
      sniffnet
      # libresprite
      # aseprite-unfree
      # flutter
      # dart
      # gtk3
      # cairo
      # pango
      # atk
      # glib
      # libepoxy
      # redis
      # redis-desktop-manager
      # iredis
      dfeet
      hyperfine
      # pgadmin
      ventoy-full
      hurl
      jq
      nodePackages.npm
      nodejs
    ];
  };
}
