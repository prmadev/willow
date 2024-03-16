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
      # clang
      cmake
      pkg-config
      openssl_3
      musl
      gum
      # calibre
      mprocs # not a monitoring tool
      # d2
      # zk
      # trashy
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
      # dfeet
      hyperfine
      # pgadmin
      ventoy-full
      hurl
      nodePackages.npm
      nodejs
    ];
  };
}
