{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    cat.mocha.rosewater.hex = mkOption {
      type = types.str;
      default = "#f5e0dc";
    };
    cat.mocha.flamingo.hex = mkOption {
      type = types.str;
      default = "#f2cdcd";
    };
    cat.mocha.pink.hex = mkOption {
      type = types.str;
      default = "#f5c2e7";
    };
    cat.mocha.mauve.hex = mkOption {
      type = types.str;
      default = "#cba6f7";
    };
    cat.mocha.red.hex = mkOption {
      type = types.str;
      default = "#f38ba8";
    };
    cat.mocha.maroon.hex = mkOption {
      type = types.str;
      default = "#eba0ac";
    };
    cat.mocha.peach.hex = mkOption {
      type = types.str;
      default = "#fab387";
    };
    cat.mocha.yellow.hex = mkOption {
      type = types.str;
      default = "#f9e2af";
    };
    cat.mocha.green.hex = mkOption {
      type = types.str;
      default = "#a6e3a1";
    };
    cat.mocha.teal.hex = mkOption {
      type = types.str;
      default = "#94e2d5";
    };
    cat.mocha.sky.hex = mkOption {
      type = types.str;
      default = "#89dceb";
    };
    cat.mocha.sapphire.hex = mkOption {
      type = types.str;
      default = "#74c7ec";
    };
    cat.mocha.blue.hex = mkOption {
      type = types.str;
      default = "#89b4fa";
    };
    cat.mocha.lavender.hex = mkOption {
      type = types.str;
      default = "#b4befe";
    };
    cat.mocha.text.hex = mkOption {
      type = types.str;
      default = "#cdd6f4";
    };
    cat.mocha.subtext1.hex = mkOption {
      type = types.str;
      default = "#bac2de";
    };
    cat.mocha.subtext0.hex = mkOption {
      type = types.str;
      default = "#a6adc8";
    };
    cat.mocha.overlay0.hex = mkOption {
      type = types.str;
      default = "#6c7086";
    };
    cat.mocha.overlay1.hex = mkOption {
      type = types.str;
      default = "#7f849c";
    };
    cat.mocha.overlay2.hex = mkOption {
      type = types.str;
      default = "#9399b2";
    };
    cat.mocha.surface0.hex = mkOption {
      type = types.str;
      default = "#313244";
    };
    cat.mocha.surface1.hex = mkOption {
      type = types.str;
      default = "#45475a";
    };
    cat.mocha.surface2.hex = mkOption {
      type = types.str;
      default = "#585b70";
    };
    cat.mocha.base.hex = mkOption {
      type = types.str;
      default = "#363a4f";
    };
    cat.mocha.mantle.hex = mkOption {
      type = types.str;
      default = "#181825";
    };
    cat.mocha.crust.hex = mkOption {
      type = types.str;
      default = "#11111b";
    };
    ### now for the rgb

    cat.mocha.rosewater.rgb = mkOption {
      type = types.listOf types.int;
      default = [245 224 220];
    };
    cat.mocha.flamingo.rgb = mkOption {
      type = types.listOf types.int;
      default = [242 205 205];
    };
    cat.mocha.pink.rgb = mkOption {
      type = types.listOf types.int;
      default = [245 194 231];
    };
    cat.mocha.mauve.rgb = mkOption {
      type = types.listOf types.int;
      default = [203 166 247];
    };
    cat.mocha.red.rgb = mkOption {
      type = types.listOf types.int;
      default = [243 139 168];
    };
    cat.mocha.maroon.rgb = mkOption {
      type = types.listOf types.int;
      default = [235 160 172];
    };
    cat.mocha.peach.rgb = mkOption {
      type = types.listOf types.int;
      default = [250 179 135];
    };
    cat.mocha.yellow.rgb = mkOption {
      type = types.listOf types.int;
      default = [249 226 175];
    };
    cat.mocha.green.rgb = mkOption {
      type = types.listOf types.int;
      default = [166 227 161];
    };
    cat.mocha.teal.rgb = mkOption {
      type = types.listOf types.int;
      default = [148 226 213];
    };
    cat.mocha.sky.rgb = mkOption {
      type = types.listOf types.int;
      default = [137 220 235];
    };
    cat.mocha.sapphire.rgb = mkOption {
      type = types.listOf types.int;
      default = [116 199 236];
    };
    cat.mocha.blue.rgb = mkOption {
      type = types.listOf types.int;
      default = [137 180 250];
    };
    cat.mocha.lavender.rgb = mkOption {
      type = types.listOf types.int;
      default = [180 190 254];
    };
    cat.mocha.text.rgb = mkOption {
      type = types.listOf types.int;
      default = [205 214 244];
    };
    cat.mocha.subtext1.rgb = mkOption {
      type = types.listOf types.int;
      default = [186 194 222];
    };
    cat.mocha.subtext0.rgb = mkOption {
      type = types.listOf types.int;
      default = [166 173 200];
    };
    cat.mocha.overlay0.rgb = mkOption {
      type = types.listOf types.int;
      default = [108 112 134];
    };
    cat.mocha.overlay1.rgb = mkOption {
      type = types.listOf types.int;
      default = [127 132 156];
    };
    cat.mocha.overlay2.rgb = mkOption {
      type = types.listOf types.int;
      default = [147 153 178];
    };
    cat.mocha.surface0.rgb = mkOption {
      type = types.listOf types.int;
      default = [49 50 68];
    };
    cat.mocha.surface1.rgb = mkOption {
      type = types.listOf types.int;
      default = [69 71 90];
    };
    cat.mocha.surface2.rgb = mkOption {
      type = types.listOf types.int;
      default = [88 91 112];
    };
    cat.mocha.base.rgb = mkOption {
      type = types.listOf types.int;
      default = [30 30 46];
    };
    cat.mocha.mantle.rgb = mkOption {
      type = types.listOf types.int;
      default = [24 24 37];
    };
    cat.mocha.crust.rgb = mkOption {
      type = types.listOf types.int;
      default = [17 17 27];
    };
  };
}
