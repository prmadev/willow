{lib, ...}:
with lib; {
  options = let
    mkColor = s: {l ? [0 0 0]}: {
      hex = mkOption {
        type = types.str;
        default = "#${s}";
      };

      rawHex = mkOption {
        type = types.str;
        default = s;
      };
      rgb = mkOption {
        type = types.listOf types.int;
        default = l;
      };
    };
  in {
    colors = {
      macchiato = {
        rosewater = mkColor "f4dbd6" {};
        flamingo = mkColor "f0c6c6" {};
        pink = mkColor "f5bde6" {};
        mauve = mkColor "c6a0f6" {};
        red = mkColor "ed8796" {};
        maroon = mkColor "ee99a0" {};
        peach = mkColor "f5a97f" {};
        yellow = mkColor "eed49f" {};
        green = mkColor "a6da95" {};
        teal = mkColor "8bd5ca" {};
        sky = mkColor "91d7e3" {};
        sapphire = mkColor "7dc4e4" {};
        blue = mkColor "8aadf4" {};
        lavendar = mkColor "b7bdf8" {};
        text = mkColor "cad3f5" {};
        subtext1 = mkColor "b8c0e0" {};
        subtext0 = mkColor "a5adcb" {};
        overlay2 = mkColor "939ab7" {};
        overlay1 = mkColor "8087a2" {};
        overlay0 = mkColor "6e738d" {};
        surface2 = mkColor "5b6078" {};
        surface1 = mkColor "494d64" {};
        surface0 = mkColor "363a4f" {};
        base = mkColor "24273a" {};
        mantle = mkColor "1e2030" {};
        crust = mkColor "181926" {};
      };

      rosepine = {
        rose = mkColor "ea9a97" {l = [234 154 151];};
        rosebg = mkColor "3f2f39" {l = [];};
        pine = mkColor "3e9fb0" {l = [62 143 176];};
        pinebg = mkColor "202d3d" {l = [];};
        love = mkColor "eb6f92" {l = [235 111 146];};
        lovebg = mkColor "3f2738" {l = [];};
        foam = mkColor "9ccfd8" {l = [156 207 216];};
        foambg = mkColor "313845" {l = [];};
        gold = mkColor "f5c177" {l = [246 193 119];};
        goldbg = mkColor "413633" {l = [];};
        iris = mkColor "c4a7e7" {l = [196 167 231];};
        irisbg = mkColor "383147" {l = [];};
        base = mkColor "232136" {l = [35 33 54];};
        surface = mkColor "2a273f" {l = [42 39 63];};
        overlay = mkColor "393552" {l = [57 53 82];};
        text = mkColor "e0def4" {l = [224 222 244];};
        subtle = mkColor "908caa" {l = [144 140 170];};
        muted = mkColor "6e6a86" {l = [110 106 134];};
        highlight-low = mkColor "2a283e" {l = [42 40 62];};
        highlight-med = mkColor "44415a" {l = [68 65 90];};
        highlight-high = mkColor "56526e" {l = [86 82 110];};
      };
    };
  };
}
