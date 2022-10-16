{lib, ...}:
with lib; {
  options = {
    colors.rose.hex = mkOption {
      type = types.str;
      default = "#ebbcba";
    };

    colors.pine.hex = mkOption {
      type = types.str;
      default = "#31748f";
    };

    colors.love.hex = mkOption {
      type = types.str;
      default = "#eb6f92";
    };

    colors.foam.hex = mkOption {
      type = types.str;
      default = "#9ccfd8";
    };

    colors.gold.hex = mkOption {
      type = types.str;
      default = "#f6c177";
    };

    colors.iris.hex = mkOption {
      type = types.str;
      default = "#c4a7e7";
    };

    colors.base.hex = mkOption {
      type = types.str;
      default = "#191724";
    };

    colors.surface.hex = mkOption {
      type = types.str;
      default = "#1f1d2e";
    };
    colors.overlay.hex = mkOption {
      type = types.str;
      default = "#26233a";
    };
    colors.text.hex = mkOption {
      type = types.str;
      default = "#e0def4";
    };
    colors.subtle.hex = mkOption {
      type = types.str;
      default = "#908caa";
    };
    colors.muted.hex = mkOption {
      type = types.str;
      default = "#6e6a86";
    };
    colors.highlight-low.hex = mkOption {
      type = types.str;
      default = "#21202e";
    };
    colors.highlight-med.hex = mkOption {
      type = types.str;
      default = "#403d52";
    };
    colors.highlight-high.hex = mkOption {
      type = types.str;
      default = "#524f67";
    };

    # RGB

    colors.rose.rgb = mkOption {
      type = types.listOf types.int;
      default = [235 188 186];
    };

    colors.pine.rgb = mkOption {
      type = types.listOf types.int;
      default = [49 116 143];
    };

    colors.love.rgb = mkOption {
      type = types.listOf types.int;
      default = [235 111 146];
    };

    colors.foam.rgb = mkOption {
      type = types.listOf types.int;
      default = [156 207 216];
    };

    colors.gold.rgb = mkOption {
      type = types.listOf types.int;
      default = [246 193 119];
    };

    colors.iris.rgb = mkOption {
      type = types.listOf types.int;
      default = [196 167 231];
    };

    colors.base.rgb = mkOption {
      type = types.listOf types.int;
      default = [25 23 36];
    };

    colors.surface.rgb = mkOption {
      type = types.listOf types.int;
      default = [31 29 46];
    };
    colors.overlay.rgb = mkOption {
      type = types.listOf types.int;
      default = [38 35 58];
    };
    colors.text.rgb = mkOption {
      type = types.listOf types.int;
      default = [224 222 244];
    };
    colors.subtle.rgb = mkOption {
      type = types.listOf types.int;
      default = [144 140 170];
    };
    colors.muted.rgb = mkOption {
      type = types.listOf types.int;
      default = [110 106 134];
    };
    colors.highlight-low.rgb = mkOption {
      type = types.listOf types.int;
      default = [33 32 46];
    };
    colors.highlight-med.rgb = mkOption {
      type = types.listOf types.int;
      default = [64 61 82];
    };
    colors.highlight-high.rgb = mkOption {
      type = types.listOf types.int;
      default = [82 79 103];
    };
  };
}
