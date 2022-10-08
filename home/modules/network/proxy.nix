{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    proxy.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.proxy.enable {
    home.packages = with pkgs; [
      clash # for networking #TODO
      shadowsocks-rust
      proxychains-ng
      chisel
      protonvpn-cli
    ];

    home.file = {
      ".config/clash/config.yaml" = {
        source = ./config.yaml;
      };
    };

    home.file = {
      ".config/shadowsocks/config.json" = {
        source = ./shadowsocks.json;
      };
    };
    home.file = {
      ".proxychains/proxychains.conf" = {
        source = ./proxychains.conf;
      };
    };

    # systemd.user.services.clash = {
    #   Unit = {
    #     Description = "Clash daemon, A rule-based proxy in Go.";
    #     After = "network.target";
    #   };
    #
    #   Service = {
    #     Type = "simple";
    #     Restart = "always";
    #     ExecStart = "${pkgs.clash}/bin/clash";
    #   };
    #   Install = {
    #     WantedBy = ["paths.target"];
    #   };
    # };
  };
}
