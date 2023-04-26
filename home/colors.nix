{lib, ...}:
with lib; {
  options = {
    colors.macchiato.rosewater.hex = mkOption {
      type = types.str;
      default = "#f4dbd6";
    };
    colors.macchiato.flamingo.hex = mkOption {
      type = types.str;
      default = "#f0c6c6";
    };
    colors.macchiato.pink.hex = mkOption {
      type = types.str;
      default = "#f5bde6";
    };
    colors.macchiato.mauve.hex = mkOption {
      type = types.str;
      default = "#c6a0f6";
    };
    colors.macchiato.red.hex = mkOption {
      type = types.str;
      default = "#ed8796";
    };
    colors.macchiato.maroon.hex = mkOption {
      type = types.str;
      default = "#ee99a0";
    };
    colors.macchiato.peach.hex = mkOption {
      type = types.str;
      default = "#f5a97f";
    };
    colors.macchiato.yellow.hex = mkOption {
      type = types.str;
      default = "#eed49f";
    };
    colors.macchiato.green.hex = mkOption {
      type = types.str;
      default = "#a6da95";
    };
    colors.macchiato.teal.hex = mkOption {
      type = types.str;
      default = "#8bd5ca";
    };

    colors.macchiato.sky.hex = mkOption {
      type = types.str;
      default = "#91d7e3";
    };
    colors.macchiato.sapphire.hex = mkOption {
      type = types.str;
      default = "#7dc4e4";
    };
    colors.macchiato.blue.hex = mkOption {
      type = types.str;
      default = "#8aadf4";
    };
    colors.macchiato.lavendar.hex = mkOption {
      type = types.str;
      default = "#b7bdf8";
    };
    colors.macchiato.text.hex = mkOption {
      type = types.str;
      default = "#cad3f5";
    };

    colors.macchiato.subtext1.hex = mkOption {
      type = types.str;
      default = "#b8c0e0";
    };
    colors.macchiato.subtext0.hex = mkOption {
      type = types.str;
      default = "#a5adcb";
    };
    colors.macchiato.overlay2.hex = mkOption {
      type = types.str;
      default = "#939ab7";
    };
    colors.macchiato.overlay1.hex = mkOption {
      type = types.str;
      default = "#8087a2";
    };
    colors.macchiato.overlay0.hex = mkOption {
      type = types.str;
      default = "#6e738d";
    };
    colors.macchiato.surface2.hex = mkOption {
      type = types.str;
      default = "#5b6078";
    };
    colors.macchiato.surface1.hex = mkOption {
      type = types.str;
      default = "#494d64";
    };
    colors.macchiato.surface0.hex = mkOption {
      type = types.str;
      default = "#363a4f";
    };
    colors.macchiato.base.hex = mkOption {
      type = types.str;
      default = "#24273a";
    };
    colors.macchiato.mantle.hex = mkOption {
      type = types.str;
      default = "#1e2030";
    };
    colors.macchiato.crust.hex = mkOption {
      type = types.str;
      default = "#181926";
    };

    colors.rose.hex = mkOption {
      type = types.str;
      default = "#ea9a97";
    };
    colors.rosebg.hex = mkOption {
      type = types.str;
      default = "#3F2F39";
    };

    colors.pine.hex = mkOption {
      type = types.str;
      default = "#3e8fb0";
    };
    colors.pinebg.hex = mkOption {
      type = types.str;
      default = "#202D3D";
    };

    colors.love.hex = mkOption {
      type = types.str;
      default = "#eb6f92";
    };
    colors.lovebg.hex = mkOption {
      type = types.str;
      default = "#3F2738";
    };

    colors.foam.hex = mkOption {
      type = types.str;
      default = "#9ccfd8";
    };
    colors.foambg.hex = mkOption {
      type = types.str;
      default = "#313845";
    };

    colors.gold.hex = mkOption {
      type = types.str;
      default = "#f6c177";
    };
    colors.goldbg.hex = mkOption {
      type = types.str;
      default = "#413633";
    };

    colors.iris.hex = mkOption {
      type = types.str;
      default = "#c4a7e7";
    };
    colors.irisbg.hex = mkOption {
      type = types.str;
      default = "#383147";
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
