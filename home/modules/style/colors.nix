{lib, ...}:
with lib; {
  options = {
    colors.rose.hex = mkOption {
      type = types.str;
      default = "#ea9a97";
    };
    colors.rosebg.hex = mkOption {
      type = types.str;
      default = "#ea9a9788";
    };

    colors.pine.hex = mkOption {
      type = types.str;
      default = "#3e8fb0";
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
      default = "#232136";
    };

    colors.surface.hex = mkOption {
      type = types.str;
      default = "#2a273f";
    };
    colors.overlay.hex = mkOption {
      type = types.str;
      default = "#393552";
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
      default = "#2a283e";
    };
    colors.highlight-med.hex = mkOption {
      type = types.str;
      default = "#44415a";
    };
    colors.highlight-high.hex = mkOption {
      type = types.str;
      default = "#56526e";
    };

    # RGB

    colors.rose.rgb = mkOption {
      type = types.listOf types.int;
      default = [234 154 151];
    };

    colors.pine.rgb = mkOption {
      type = types.listOf types.int;
      default = [62 143 176];
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
      default = [35 33 54];
    };

    colors.surface.rgb = mkOption {
      type = types.listOf types.int;
      default = [42 39 63];
    };
    colors.overlay.rgb = mkOption {
      type = types.listOf types.int;
      default = [57 53 82];
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
      default = [42 40 62];
    };
    colors.highlight-med.rgb = mkOption {
      type = types.listOf types.int;
      default = [68 65 90];
    };
    colors.highlight-high.rgb = mkOption {
      type = types.listOf types.int;
      default = [86 82 110];
    };
  };
}
