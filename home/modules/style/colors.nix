{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    colors.rose = mkOption {
      type = types.str;
      default = "#ebbcba";
    };

    colors.pine = mkOption {
      type = types.str;
      default = "#31748f";
    };

    colors.love = mkOption {
      type = types.str;
      default = "#eb6f92";
    };

    colors.foam = mkOption {
      type = types.str;
      default = "#9ccfd8";
    };

    colors.gold = mkOption {
      type = types.str;
      default = "#f6c177";
    };

    colors.iris = mkOption {
      type = types.str;
      default = "#c4a7e7";
    };

    colors.base = mkOption {
      type = types.str;
      default = "#191724";
    };

    colors.surface = mkOption {
      type = types.str;
      default = "#1f1d2e";
    };
    colors.overlay = mkOption {
      type = types.str;
      default = "#26233a";
    };
    colors.text = mkOption {
      type = types.str;
      default = "#e0def4";
    };
    colors.subtle = mkOption {
      type = types.str;
      default = "#908caa";
    };
    colors.muted = mkOption {
      type = types.str;
      default = "#6e6a86";
    };
    colors.highlight-low = mkOption {
      type = types.str;
      default = "#21202e";
    };
    colors.highlight-med = mkOption {
      type = types.str;
      default = "#403d52";
    };
    colors.highlight-high = mkOption {
      type = types.str;
      default = "#524f67";
    };
  };
}
